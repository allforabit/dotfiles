;;; config.el --- Additional evil config -*- lexical-binding: t; -*-

;; (message (file-name-directory (or load-file-name buffer-file-name)))

(setq evil-structural-load-path (file-name-directory (or load-file-name buffer-file-name)))

(def-package! evil-cleverparens)
;; Make which key help with evil text objects
;; (after! evil (which-key-show-operator-state-maps))
(def-package! evil-structural
  :load-path evil-structural-load-path
  :config
  (add-hook! js2-mode-hook evil-structural-mode))

