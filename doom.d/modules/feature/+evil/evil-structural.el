;;; evil-structural.el --- Evil structural -*- lexical-binding: t; -*-

;; TODO Maybe use this
;; E.G. org mode hook
;; (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
;;         (newmap (make-sparse-keymap)))
;;     (set-keymap-parent newmap oldmap)
;;     (define-key newmap (kbd "C-c +") nil)
;;     (define-key newmap (kbd "C-c -") nil)
;;     (make-local-variable 'minor-mode-overriding-map-alist)
;;     (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))

(define-minor-mode evil-structural-mode
  "A minor mode for integrating evil with lispy."
  :lighter " ES"
  :keymap (make-sparse-keymap))

(defcustom evil-structural-mode-list
  `(web-mode)
  "The list of modes which will be evilified by `evil-structural-init'.
Elements are either target mode symbols or lists which `car' is the
mode symbol and `cdr' the packages to register."
  :type '(repeat (choice symbol sexp))
  :group 'evil-structural)

(defun evil-structural-hi ()
  (interactive)
  (message "Hello world"))

(defun evil-structural-web-mode-setup ()
  "Set up `evil' bindings for `image-mode'."
  (evil-define-key 'normal web-mode-map
    ;; motion
    "j" 'evil-structural-hi))

(add-hook 'web-mode-hook
          (lambda ()
            (push
             '("<script" . (?x (Br . Bc) ?- (Br . Bc) ?S)) prettify-symbols-alist)))

(defun evil-structural-hide-stuff ()
  "Hello yo"
  (interactive)
  (let ((beg 1)
        (end 2))
        (setq overlay (make-overlay beg end))
        (overlay-put overlay 'font-lock-face 'web-mode-folded-face)
        (put-text-property beg end 'invisible t)))

;;;###autoload
(defun evil-structural-init ()
  "Register the Evil bindings for all modes in `evil-structural-mode-list'.
Alternatively, you may register select bindings manually, for
instance:
  (with-eval-after-load 'calendar
    (require 'evil-structural-calendar)
    (evil-structural-calendar-setup))"
  (interactive)
  (dolist (mode evil-structural-mode-list)
    (let ((m mode)
          (reqs (list mode)))
      (when (listp mode)
        (setq m (car mode)
              reqs (cdr mode)))
      (dolist (req reqs)
        (with-eval-after-load req
          ;; (require (intern (concat "evil-collection-" (symbol-name m))))
          (funcall (intern (concat "evil-structural-" (symbol-name m)
                                   "-setup")))
          (let ((mode-keymaps
                 (ignore-errors
                   (symbol-value
                    (intern (format "evil-structural-%s-maps" m))))))
            (run-hook-with-args 'evil-structural-setup-hook
                                m mode-keymaps)))))))

;;;###autoload

(evil-define-operator evil-structural-narrow-indirect (beg end type)
  "Indirectly narrow the region from BEG to END."
  (interactive "<R>")
  (evil-normal-state)
  (narrow-to-region-indirect beg end))

(define-key evil-normal-state-map "m" 'evil-narrow-indirect)
(define-key evil-visual-state-map "m" 'evil-narrow-indirect)

(provide 'evil-structural)
;;; evil-structural.el ends here
