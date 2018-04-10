;;; config.el --- + Web config -*- lexical-binding: t; -*-


(def-package! ac-html-bootstrap)

(def-project-mode! +web-bootstrap-mode
  :on-enter
  (company-web-bootstrap+)
  (company-web-fa+)
  )

