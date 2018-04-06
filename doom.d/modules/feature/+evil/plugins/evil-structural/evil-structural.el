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
  :lighter " LYVLE"
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
    "ZZ" 'evil-structural-hi)
  )

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

(provide 'evil-structural)
;;; evil-structural.el ends here
