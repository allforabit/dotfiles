;;; private/allforabit/config.el -*- lexical-binding: t; -*-
;; (def-package! solarized-theme
;;   :demand t
;;   :config
;;   (load-theme 'solarized-dark))
;; (def-package! evil-collection
;;   :after evil
;;   :config
;;   (setq evil-collection-company-use-tng nil
;;         evil-collection-outline-bind-tab-p nil
;;         evil-collection-term-sync-state-and-mode-p nil)
;;   ; (evil-collection-init)
;; )

;; Project list for use by prodigy / doom projects
(setq a4b-project-file '("~/Bitbucket/org/projects.el"))

;; Disable for now
;; (setq gac-automatically-push-p t)
;; (def-package! git-auto-commit-mode
;;   :config
;;   ;; Push automatically
;;   )

(defun a4b-git-pull-if-clean ()
  "Some stuff here."
  (interactive)
  (message (shell-command-to-string "
if [ -z '$(git status --porcelain)' ]; then
  echo 'clean'
  git pull
else
  echo 'dirty'
fi
")))

;; Make magit work
(set! :popup "^\\*magit" :ignore)



;; temp-mode.el
;; Temporary minor mode
;; Main use is to enable it only in specific buffers to achieve the goal of
;; buffer-specific keymaps

(defvar temp-mode-map (make-sparse-keymap)
  "Keymap while temp-mode is active.")

;;;###autoload
(define-minor-mode temp-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " Temp"
  temp-mode-map)

;; (provide 'temp-mode)

;; Source: https://emacs.stackexchange.com/questions/519/key-bindings-specific-to-a-buffer
;; Usage:
;; eval: (temp-mode 1)
;; eval: (define-key temp-mode-map (kbd "<f10>") 'function-ONE)
;; (def-package! fakecygpty
;;   :config
;;   (message "Activating Fake cyg pty")
;;   (fakecygpty-activate))

;; (make-comint-in-buffer "cmd" nil "cmd" nil)
;; (setq explicit-shell-file-name "c:/msys64/usr/bin/bash.exe")
;; (setq shell-file-name explicit-shell-file-name)
;; TODO move out of public repo
(after! prodigy
  (prodigy-define-service
   :name "WLB electron"
   :command "c:/Users/admin/Documents/Bitbucket/wlb/wlb-ui-desktop/node_modules/.bin/electron.cmd"
   :args '(".")
   :cwd "c:/Users/admin/Documents/Bitbucket/wlb/wlb-ui-desktop/app"
   :tags '(work)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "Plein Air"
   :command "yarn"
   :args '("run" "start")
   :cwd "~/Documents/Github/plein-air/wp-content/themes/plein-air"
   :tags '(work)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "Campus 2017"
   :command "gulp"
   :args '("watch")
   :cwd "c:/Users/admin/Documents/Bitbucket/campus/wp-content/themes/campus-theme/"
   :tags '(work)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "React sandbox"
   :command "yarn"
   :args '("start")
   :cwd "c:/Users/admin/Documents/Bitbucket/org/code/js/react"
   :tags '(play)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "Yarn test"
   :command "yarn"
   :args '("run" "test")
   :cwd "~/Documents/Github/elephantbrain"
   :tags '(play)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "Mailcatcher (1080, 1025)"
   :command "mailcatcher"
   :tags '(work)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "Elephant brain"
   :command "yarn"
   :args '("run" "start")
   :cwd "~/Documents/GitHub/elephantbrain/"
   :tags '(personal)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  )

;; (setq +lookup-open-url-fn 'eww)
;; TODO remove / make more generic
(setenv "NODE_PATH"
        (concat
         "~/Documents/Bitbucket/org/node_modules" ":"
         (getenv "NODE_PATH")
         )
        )

;; Javascript

(def-package! ob-typescript)
(def-package! indium)

(setq js2-basic-offset 2)
(setq typescript-indent-level 2)

(def-package! pdf-tools
  :if (display-graphic-p)
  :mode ("\\.pdf$" . pdf-view-mode)
  :init (load "pdf-tools-autoloads" nil t)
  :config (pdf-tools-install))
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
(set! :popup "^\\*Org Src"    '((size . 0.8)) '((quit) (select . t) (modeline . t)))

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

(def-package! ob-async)
;; (def-package! ob-clojure-literate)

;; TODO figure out how it works and re-enable
;; (after! org
;;   (setq ob-clojure-literate-auto-jackin-p t)
;;   (add-hook 'org-mode-hook #'ob-clojure-literate-mode))
(def-package! firestarter
:config
  ;; Start by default
  (firestarter-mode))
(put 'firestarter 'safe-local-variable 'identity)

(def-package! xmlgen)

;; Image refresh fix
;; https://emacs.stackexchange.com/questions/2303/making-an-image-ie-image-mode-auto-reload-changes-from-disk
(add-hook 'image-mode #'auto-image-file-mode)

;; UTF-8 everywhere
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Package to filter modeline items
;; TODO not working at the moment
(def-package! rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-whitelist ""))

;; (def-package! list-processes+)

(def-package! emacs-snippets
  :after yasnippet
  :config
  (delete yas--default-user-snippets-dir yas-snippet-dirs)
  ;; Personal emacs snippets (probably shouldn't be used in favour of emacs
  ;; snippets package)
  (add-to-list 'yas-snippet-dirs "~/Documents/Github/dotfiles/emacs/snippets"))

;; Make it possible to add hashes and euro symbols
(setq mac-right-option-modifier nil)
;; from modules/completion/company/config.el
;; Drupal mode

;; (def-package! drupal-mode)

;; (def-package! psysh)
(def-package! livid-mode)
;; (def-package! ob-php)

(load! +bindings)  ; my key bindings
(when IS-WINDOWS
  (load! +windows))

;;
;; (after! doom-themes
;;   ;; Since Fira Mono doesn't have an italicized variant, highlight it instead
;;   (set-face-attribute 'italic nil
;;                       :weight 'ultra-light
;;                       :foreground "#ffffff"
;;                       :background (doom-color 'current-line)))


(setq org-babel-clojure-backend 'cider)

;; app/email
(after! mu4e
  (setq smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)

  (set! :email "gmail.com"
    '((mu4e-sent-folder       . "/gmail.com/Sent Mail")
      (mu4e-drafts-folder     . "/gmail.com/Drafts")
      (mu4e-trash-folder      . "/gmail.com/Trash")
      (mu4e-refile-folder     . "/gmail.com/All Mail")
      (smtpmail-smtp-user     . "kevnolan")
      (user-mail-address      . "kevnolan@gmail.com")
      (mu4e-compose-signature . "---\nKevin Nolan")))
  )

(after! evil-escape
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-excluded-major-modes '(neotree-mode)
        evil-escape-key-sequence "fd"
        evil-escape-delay 0.25))

;; Will need to be more specific
(def-project-mode! +web-thing-mode
  :modes (js2-mode typescript-mode)
  :files (and "webpack.config.js" "tsconfig.json"))

;; Again will need to be more specific
(def-project-mode! +web-tachyons-mode
  :modes (js2-mode typescript-mode)
  :files (and "webpack.config.js" "tsconfig.json"))

(def-package! ahk-mode)
