;;; evil-structural.el --- Evil structural -*- lexical-binding: t; -*-
(require 'evil)
(require 'evil-cleverparens-text-objects)

;;;###autoload
(define-minor-mode evil-structural-mode
  "A minor mode for integrating evil with lispy."
  :lighter " ES"
  :keymap (make-sparse-keymap)
  (evil-normalize-keymaps))

;;;###autoload
(defun evil-structural-mode-install () (evil-structural-mode 1))

;;;###autoload
(define-globalized-minor-mode global-evil-structural-mode
  evil-extra-operator-mode evil-extra-operator-mode-install
  "Global minor mode of Evil structural.")

(defvar evil-structural-overrides '()
  "A PLIST of overrides to be applied to
each evil text object. Will use advice to apply overrides. Although this may
  change in the future. E.g. could do the override using key maps.")

(defun evil-structural-register (major-mode evil-symbol)
  "Register an evil structural override(s) for major mode"
  (if (listp evil-symbol)
    (cl-loop for s in evil-symbol 
             (evil-structural-register s))
    (message (concat "Adding major mode: " "thing"))))

(defun evil-structural-advice (orig-fun &rest args)
  (if (bound-and-true-p evil-structural-mode)
      (progn
        ;; (apply orig-fun args)
        (message "Do an override here based on evil-structural-overrides")
        ;; TODO doesn't seem to be applying result like for like with original function
        (apply 'evil-inner-symbol args)
        ;; Cancel and go back to normal state
        ;; (evil-normal-state)
        )
    (apply orig-fun args)))

(advice-remove 'evil-inner-word #'evil-structural-advice)
(advice-add 'evil-inner-word :around #'evil-structural-advice)

(evil-structural-register 'org-mode '(evil-a-word evil-a-paragraph))


;; https://gist.github.com/hyone/1323137
(setq evil-structural-move-defun-alist
      '((ruby-mode . (ruby-beginning-of-defun . ruby-end-of-defun))
        (c-mode    . (c-beginning-of-defun . c-end-of-defun))
        (rjsx-mode  . (beginning-of-defun . end-of-defun))))

(defun evil-structural-move-defun (count &optional begin-defun end-defun)
  "Move by defun"
  (let ((count (or count 1))
        (begin-defun (or begin-defun 'beginning-of-defun))
    (end-defun (or end-defun 'end-of-defun)))
(evil-motion-loop (var count)
      (cond
       ((< var 0) (funcall begin-defun))
       (t         (funcall end-defun))))))

(evil-define-text-object evil-structural-a-defun (&optional count begin end type)
  "Select a defun."
  (let* ((sexp (sp-get-hybrid-sexp))
         (beg (plist-get sexp :beg))
         (end (plist-get sexp :end)))
    (evil-range beg end 'exclusive :expanded t)))


;; Cleverparens objects (should work with modes supported by smartparens)
;; Form (F)
(evil-define-key 'visual evil-structural-mode-map "if" 'evil-cp-inner-form)
(evil-define-key 'visual evil-structural-mode-map "af" 'evil-cp-a-form)
(evil-define-key 'operator-state evil-structural-mode-map "if" 'evil-cp-inner-form)
(evil-define-key 'operator-state evil-structural-mode-map "af" 'evil-cp-a-form)
;; Defun (D)
(evil-define-key 'visual evil-structural-mode-map "id" 'evil-cp-inner-defun)
(evil-define-key 'visual evil-structural-mode-map "ad" 'evil-structural-a-defun)
(evil-define-key 'operator-state evil-structural-mode-map "id" 'evil-cp-inner-defun)
(evil-define-key 'operator-state evil-structural-mode-map "ad" 'evil-structural-a-defun)
;; Comment (C)
(evil-define-key 'visual evil-structural-mode-map "ic" 'evil-cp-inner-comment)
(evil-define-key 'visual evil-structural-mode-map "ac" 'evil-cp-a-comment)
(evil-define-key 'operator-state evil-structural-mode-map "ic" 'evil-cp-inner-comment)
(evil-define-key 'operator-state evil-structural-mode-map "ac" 'evil-cp-a-comment)

(provide 'evil-structural)
