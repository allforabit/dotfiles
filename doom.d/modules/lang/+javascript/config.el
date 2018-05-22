;;; config.el --- Additional js config -*- lexical-binding: t; -*-

(def-package! lsp-javascript-typescript
  :when (featurep! :feature +lsp)
  :commands (lsp-javascript-typescript-enable)
  :config
  ;; This probably won't do much unless integrated with company
  ;; Probably not needed as tide seems to be a better option
  (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
  (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
  (add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
  (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
  )

;; Javascript

(def-package! ob-typescript)
(def-package! indium)
(def-package! prettier-js
  :config
  ;; Too troublesome for now
  ;; TODO enable on a project by project basis
    ;; (add-hook! '(js2-mode-hook typescript-mode-hook) #'prettier-js-mode)
    )

;; TODO use editorconfig system
(setq js2-basic-offset 2)
(setq typescript-indent-level 2)

(set! :popup "^.*js repl" '((slot . -1) (vslot . 1) (side . right) (size . 80)) '((select . t)))
