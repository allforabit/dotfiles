;;; windows.el --- Windows customisations -*- lexical-binding: t; -*-

(setq shell-file-name (executable-find "zsh.exe"))
(setenv "PATH" "C:\\programs\\msys2\\mingw64\\bin;C:\\programs\\msys2\\usr\\local\\bin;C:\\programs\\msys2\\usr\\bin;C:\\Windows\\System32;C:\\Windows")

(provide 'windows)
;;; windows.el ends here
