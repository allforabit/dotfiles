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
  '(lispyville lispy)
  "The list of Lisp packages required by the a4b-lisp layer.")

(defun a4b-lisp/init-lispy ()
  (use-package lispy
    :diminish lispy-mode
    ;; :defer t
    :init
    (progn
      (message "lispy init")
      ;; Lispyville mode
      (add-hook 'emacs-lisp-mode-hook 'lispy-mode)
      (add-hook 'clojure-mode-hook 'lispy-mode)
      (add-hook 'cider-mode-hook 'lispy-mode)
      (add-hook 'common-lisp-mode-hook 'lispy-mode)
      (add-hook 'scheme-mode-hook 'lispy-mode)
      (add-hook 'lisp-mode-hook 'lispy-mode)
      ;; Turn off smartparens
      (add-hook 'emacs-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'clojure-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'cider-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'common-lisp-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'scheme-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'lisp-mode-hook #'turn-off-smartparens-mode))
    :config
    (progn
      ;; TODO make all letters more vim like
      (lispy-define-key lispy-mode-map "m" #'lispy-view))))

(defun a4b-lisp/init-lispyville ()
  (use-package lispyville
    :diminish lispyville-mode
    ;; :defer t
    :init
    (progn
      (message "lispyville init")
      (add-hook 'lispy-mode-hook #'lispyville-mode))
    :config
    (progn
      (message "lispyville config")
      (lispy-define-key lispy-mode-map "v" #'lispyville-toggle-mark-type)
      (lispyville-set-key-theme '(operators
                                  escape
                                  s-operators
                                  additional-movement
                                  slurp/barf-cp
                                  additional
                                  mark-toggle)))))
