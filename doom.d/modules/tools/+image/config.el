;;; config.el --- Image config -*- lexical-binding: t; -*-

(after! image-mode
  ;; (setq image-mode-map (make-sparse-keymap))
  (evil-define-key 'normal image-mode-map (kbd "SPC") nil)
  )

(def-package! image+
  :config
  ;; (setq imagex-auto-adjust-mode nil)
  (imagex-auto-adjust-mode 0)
  )
