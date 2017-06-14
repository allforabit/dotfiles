;;; packages.el --- a4b-lisp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Kevin Nolan <kevin@MacBook-Air-4.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:
(defconst a4b-lisp-packages
  '(parinfer lispy paxedit)
  "The list of Lisp packages required by the a4b-lisp layer.")

(defun a4b-lisp/init-parinfer ()
  (use-package parinfer
    :defer t
    :diminish parinfer-mode
    :init
    (progn

      (add-hook 'emacs-lisp-mode-hook 'parinfer-mode)
      (add-hook 'clojure-mode-hook 'parinfer-mode)
      (add-hook 'common-lisp-mode-hook 'parinfer-mode)
      (add-hook 'scheme-mode-hook 'parinfer-mode)
      (add-hook 'lisp-mode-hook 'parinfer-mode)

      (mapc (lambda (state)
              (evil-define-key state lisp-mode-map
                (kbd "M-r") 'parinfer-raise-sexp))
            '(normal insert))

      ;; Use normal avy keys
      (setq lispy-avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

      (spacemacs|add-toggle parinfer-indent
        :evil-leader "tP"
        :documentation "Enable Parinfer Indent Mode."
        :if (bound-and-true-p parinfer-mode)
        :status (eq parinfer--mode 'indent)
        :on (parinfer-toggle-mode)
        :off (parinfer-toggle-mode))
      (setq parinfer-extensions '(defaults pretty-parens evil smart-yank lispy)))
    :config
    (progn)))
      ;;(define-key parinfer-mode-map (kbd "%") 'lispy-different))))

(defun a4b-lisp/init-lispy ()
  (use-package lispy :defer t))
  ;; (use-package lispy
  ;;   :diminish lispy-mode
  ;;   :defer t
  ;;   :config
  ;;   (progn
  ;;     (mapc (lambda (state)
  ;;             (evil-define-key state lisp-mode-map
  ;;               (kbd "M-k") 'lispy-move-up
  ;;               (kbd "M-j") 'lispy-move-down))
  ;;           '(normal insert))
  ;;     (evil-define-key 'normal lisp-mode-map
  ;;       "gh" 'lispy-left
  ;;       "gj" 'lispy-down
  ;;       "gk" 'lispy-up
  ;;       "gl" 'lispy-flow))))
