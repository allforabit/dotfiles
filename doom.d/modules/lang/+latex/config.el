;;; config.el --- Latex additional config -*- lexical-binding: t; -*-

(def-package! webkit-katex-render
  :commands (webkit-katex-render-mode)
  :config
  (setq webkit-katex-render--background-color (doom-color 'fg)))
