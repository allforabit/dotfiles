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

;; Cleverparens objects (should work with modes supported by smartparens)
;; Form (F)
(evil-define-key 'visual evil-structural-mode-map "if" 'evil-cp-inner-form)
(evil-define-key 'visual evil-structural-mode-map "af" 'evil-cp-a-form)
(evil-define-key 'operator-state evil-structural-mode-map "if" 'evil-cp-inner-form)
(evil-define-key 'operator-state evil-structural-mode-map "af" 'evil-cp-a-form)
;; Defun (D)
(evil-define-key 'visual evil-structural-mode-map "id" 'evil-cp-inner-defun)
(evil-define-key 'visual evil-structural-mode-map "ad" 'evil-cp-a-defun)
(evil-define-key 'operator-state evil-structural-mode-map "id" 'evil-cp-inner-defun)
(evil-define-key 'operator-state evil-structural-mode-map "ad" 'evil-cp-a-defun)
;; Comment (C)
(evil-define-key 'visual evil-structural-mode-map "ic" 'evil-cp-inner-comment)
(evil-define-key 'visual evil-structural-mode-map "ac" 'evil-cp-a-comment)
(evil-define-key 'operator-state evil-structural-mode-map "ic" 'evil-cp-inner-comment)
(evil-define-key 'operator-state evil-structural-mode-map "ac" 'evil-cp-a-comment)

(provide 'evil-structural)
