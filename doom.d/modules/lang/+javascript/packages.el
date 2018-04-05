;;; packages.el --- Additional javascript packages -*- lexical-binding: t; -*-

(when (featurep! :feature +lsp)
  (package! lsp-javascript-typescript))

