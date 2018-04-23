;;; config.el --- description -*- lexical-binding: t; -*-

;; TODO these requires should probably be done using after and the likes
;; Check in doom project
(require 'lispy)
(require 'org-mouse)
(require 'ob-js)
(require 'cl)
(require 'rjsx-mode)

(setq org-pandoc-options
        '((standalone . t)
          (mathjax . t)))

(defun a4b-org-mode-hook ()
  (setq-local yas-buffer-local-condition
              '(not (org-in-src-block-p t))))
(add-hook 'org-mode-hook #'a4b-org-mode-hook)

(defun a4b-org-babel-skewer-js-hook ()
  (insert "

"))

;; ;; Remove wrapper
;; (setq org-babel-js-function-wrapper
;;   "\n%s\n")

;; ;; Default wrapper
;; (setq org-babel-js-function-wrapper
;;   "require('sys').print(require('sys').inspect(function(){\n%s\n}()));")

;; Setup org src to use more space
;; (set! :popup "^\\*Org Src"    '((size . 0.8)) '((quit) (select . t) (modeline . t)))
(set! :popup "^\\*[Hh]elp" '((size . 70) (slot . 0) (side . left)) '((quit) (select . t) ))


(remove-hook 'skewer-js-hook 'a4b-org-babel-skewer-js-hook)
(add-hook 'skewer-js-hook 'a4b-org-babel-skewer-js-hook)

(advice-remove 'org-babel-execute:js #'a4b-org-babel-execute:skewer)
(advice-add 'org-babel-execute:js :around 'a4b-org-babel-execute:skewer)
(defun a4b-org-babel-execute:skewer (oldFunc body params)
  (if (skewer-ping)
      (lexical-let* ((result-type (cdr (assoc :result-type params)))
                     (full-body (org-babel-expand-body:generic
                                 body params (org-babel-variable-assignments:js params)))
                     (pos (point)))
        (skewer-eval full-body (lambda (result)
                                 (let ((value))
                                   (goto-char pos)
                                   (print (alist-get 'value result))
                                   ;; (org-babel-insert-result
                                   ;;  (alist-get 'value result))
                                   )) :type "eval")
        nil)
    (apply oldFunc body params nil)))


;; https://lists.gnu.org/archive/html/emacs-orgmode/2014-06/msg00238.html
(defun a4b-org-export-remove-prelim-headlines (tree backend info)
  "Remove headlines tagged \"prelim\" while retaining their
contents before any export processing."
  (org-element-map tree org-element-all-elements
    (lambda (object)
      (when (and (equal 'headline (org-element-type object))
                 (member "prelim" (org-element-property :tags object)))
        (mapc (lambda (el)
                ;; recursively promote all nested headlines
                (org-element-map el 'headline
                  (lambda (el)
                    (when (equal 'headline (org-element-type el))
                      (org-element-put-property el
                                                :level (1- (org-element-property :level el))))))
                (org-element-insert-before el object))
              (cddr object))
        (org-element-extract-element object)))
    info nil org-element-all-elements)
  tree)

(add-hook 'org-export-filter-parse-tree-functions
          'a4b-org-export-remove-prelim-headlines)

(defcustom allforabit-src-block-keymaps
  '()
  "alist of custom keymaps for src blocks.")

(setq allforabit-src-block-keymaps
        `(("js" . ,(let ((map (make-composed-keymap `(,rjsx-mode-map
                                                      ,outline-minor-mode-map)
                                                    org-mode-map)))
                     (define-key map (kbd "C-c C-c") 'org-ctrl-c-ctrl-c)
                     map))
          ("emacs-lisp" . ,(let ((map (make-composed-keymap `(,lispy-mode-map
                                                              ,emacs-lisp-mode-map
                                                              ,outline-minor-mode-map)
                                                            org-mode-map)))
                             (define-key map (kbd "C-c C-c") 'org-ctrl-c-ctrl-c)
                             map))))

(defun allforabit-add-keymap-to-src-blocks (limit)
  "Add keymaps to src-blocks defined in `allforabit-src-block-keymaps'."
  (let ((case-fold-search t)
        lang)
    (while (re-search-forward org-babel-src-block-regexp limit t)
      (let ((lang (match-string 2))
            (beg (match-beginning 0))
            (end (match-end 0)))
        (if (assoc (org-no-properties lang) allforabit-src-block-keymaps)
            (progn
              (add-text-properties
               beg end `(local-map ,(cdr (assoc
                                          (org-no-properties lang)
                                          allforabit-src-block-keymaps))))
              (add-text-properties
               beg end `(cursor-sensor-functions
                         ((lambda (win prev-pos sym)
                            ;; This simulates a mouse click and makes a menu change
                            (org-mouse-down-mouse nil)))))))))))


(defun allforabit-spoof-mode (orig-func &rest args)
  "Advice function to spoof commands in org-mode src blocks.
It is for commands that depend on the major mode. One example is
`lispy--eval'."
  (if (org-in-src-block-p)
      (let ((major-mode (intern (format "%s-mode" (first (org-babel-get-src-block-info))))))
        (apply orig-func args))
    (apply orig-func args)))

(define-minor-mode allforabit-src-keymap-mode
  "Minor mode to add mode keymaps to src-blocks."
  :init-value nil
  (if allforabit-src-keymap-mode
      (progn
        (add-hook 'org-font-lock-hook #'allforabit-add-keymap-to-src-blocks t)
        (add-to-list 'font-lock-extra-managed-props 'local-map)
        (add-to-list 'font-lock-extra-managed-props 'cursor-sensor-functions)
        (advice-add 'lispy--eval :around 'allforabit-spoof-mode)
        (cursor-sensor-mode +1)
        (message "allforabit-src-keymap-mode enabled"))
    (remove-hook 'org-font-lock-hook #'allforabit-add-keymap-to-src-blocks)
    (advice-remove 'lispy--eval 'allforabit-spoof-mode)
    (cursor-sensor-mode -1))
  (font-lock-fontify-buffer))

;; (add-hook 'org-mode-hook (lambda ()
;; 			   (allforabit-src-keymap-mode +1)))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((clojure     . t)
;;    (emacs-lisp . t)))
