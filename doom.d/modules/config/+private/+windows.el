;;; windows.el --- Windows customisations -*- lexical-binding: t; -*-

;; TODO get this working again!!!
;; (def-package! fakecygpty
;;   :config
;;   (message "Activating Fake cyg pty")
;;   (fakecygpty-activate))

;; Setup commands
;; (make-comint-in-buffer "cmd" nil "cmd" nil)
;; (setq explicit-shell-file-name "c:/msys64/usr/bin/bash.exe")
;; (setq shell-file-name explicit-shell-file-name)
;; (after! prodigy
;;   (load (concat +org-dir "+projects.el")))


;; https://www.onwebsecurity.com/configuration/zsh-shell-inside-emacs-on-windows.html

(setq shell-file-name (executable-find "bash.exe"))

(setenv "PATH"
        (concat
         ;; Use windows node
         "C:/Program Files/nodejs" ";"
         "C:/msys64/mingw64/bin" ";"
         "C:/msys64/usr/bin" ";"
         (getenv "PATH")))

(setq wordnut-cmd "c:/Program Files/WordNet/3.0/bin/wn.exe")
