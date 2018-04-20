;;; config.el --- Additional js config -*- lexical-binding: t; -*-

(def-package! lsp-javascript-typescript
  :when (featurep! :feature +lsp)
  :commands (lsp-javascript-typescript-enable)
  :config
  (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
  (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
  (add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
  (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
  )

