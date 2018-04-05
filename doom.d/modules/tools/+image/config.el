;;; config.el --- Image config -*- lexical-binding: t; -*-

(after! image-mode
  (evil-define-key 'normal image-mode-map (kbd "SPC") nil)
  )

(def-package! image+
  :config
  ;; (setq imagex-auto-adjust-mode nil)
  (imagex-auto-adjust-mode 0)
  )
