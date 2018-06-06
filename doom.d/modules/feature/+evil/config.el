;;; config.el --- Additional evil config -*- lexical-binding: t; -*-

;; (message (file-name-directory (or load-file-name buffer-file-name)))

(setq evil-structural-load-path (file-name-directory (or load-file-name buffer-file-name)))

(def-package! evil-cleverparens)
;; Make which key help with evil text objects
;; (after! evil (which-key-show-operator-state-maps))
;; TODO seems to be giving an error
(def-package! evil-structural
  :load-path evil-structural-load-path
  :config
  ;; (add-hook 'js2-mode-hook #'evil-structural-mode)
  )

(def-package! lispyville
  :config
  (lispyville-set-key-theme
   '(operators
     prettify
     text-objects
     atom-motions
     additional-motions
     slurp/barf-cp
     wrap
     additional
     additional-insert
     additional-wrap))
  ;; (define-key lispy-mode-map-lispy "[" nil)
  ;; (define-key lispy-mode-map-lispy "]" nil)
  (add-hook 'lispy-mode-hook #'lispyville-mode))

;; (def-package! targets
;;   :config
;;   (setq targets-text-objects nil)
;;   (targets-setup)
;;   ;; (targets-define-to lispyville-comment 'lispyville-comment nil object
;;   ;;                    :bind t :keys "c")
;;   ;; (targets-define-to lispyville-atom 'lispyville-atom nil object
;;   ;;                    :bind t :keys "a")
;;   ;; (targets-define-to lispyville-list 'lispyville-list nil object
;;   ;;                    :bind t :keys "l")
;;   ;; (targets-define-to lispyville-sexp 'lispyville-sexp nil object
;;   ;;                    :bind t :keys "x")
;;   ;; (targets-define-to lispyville-function 'lispyville-function nil object
;;   ;;                    :bind t :keys "f")
;;   ;; (targets-define-to lispyville-comment 'lispyville-comment nil object
;;   ;;                    :bind t :keys "c")
;;   ;; (targets-define-to lispyville-string 'lispyville-string nil object
;;   ;;                    :bind t :keys "S")
;;   )
