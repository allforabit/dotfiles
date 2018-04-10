;;; config.el --- + CSS config -*- lexical-binding: t; -*-


(def-package! lsp-css
  ;; :when (featurep! :feature +lsp)
  :commands (lsp-css-enable)
  :config
  (add-hook 'css-mode-hook #'lsp-css-enable)
  (add-hook 'less-mode-hook #'lsp-css-enable)
  (add-hook 'sass-mode-hook #'lsp-css-enable)
  (add-hook 'scss-mode-hook #'lsp-css-enable))
