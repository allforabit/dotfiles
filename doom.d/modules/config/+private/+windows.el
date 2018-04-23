;;; windows.el --- Windows customisations -*- lexical-binding: t; -*-

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
