;;; config.el --- + Web config -*- lexical-binding: t; -*-


(def-package! ac-html-bootstrap)

(def-project-mode! +web-bootstrap-mode
  :on-enter
  (company-web-bootstrap+)
  (company-web-fa+)
  )

(after! web-mode
    (setq-default web-mode-comment-formats (remove '("javascript" . "/*") web-mode-comment-formats))
    (add-to-list 'web-mode-comment-formats '("javascript" . "//"))
    (add-to-list 'web-mode-comment-formats '("jsx" . "//"))
    (add-to-list 'web-mode-comment-formats '("tsx" . "//"))
    )
