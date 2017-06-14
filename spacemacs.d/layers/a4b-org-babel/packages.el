;;; packages.el --- a4b-org-babel layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <Admin@DESKTOP-RI55L4A>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `a4b-org-babel-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `a4b-org-babel/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `a4b-org-babel/pre-init-PACKAGE' and/or
;;   `a4b-org-babel/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst a4b-org-babel-packages
  '((org :location built-in))
  "The list of Lisp packages required by the a4b-org-babel layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format

See here for details (narrowing and changing major mode)
https://www.reddit.com/r/emacs/comments/545v9p/keybindings_strategies_in_emacs/

")

(defun a4b-org-babel-src-jump (arg jump-fn)
  (let* ((minor-modes (cl-remove-if-not (lambda (it) (and (boundp it) (symbol-value it))) minor-mode-list)))
    (when (member 'org-src-mode minor-modes)
      (if (equal arg '(4))
          (org-edit-src-abort)
        (org-edit-src-exit)))
    (when (eq major-mode 'org-mode)
      (funcall jump-fn)
      (org-edit-src-code))))

(defun a4b-org-babel-edit-next (arg)
  (interactive "P")
  (a4b-org-babel-src-jump arg #'org-babel-next-src-block))

(defun a4b-org-babel-edit-previous (arg)
  (interactive "P")
  (a4b-org-babel-src-jump arg #'org-babel-previous-src-block))



;;; packages.el ends here

(defun a4b-org-babel-entering-insert ()
  (print "entering insert mode")
  (narrow-to-defun))


(defun a4b-org-babel-exiting-insert ()
  (print "exiting insert mode")
  (widen))

;; (defun a4b-org-babel-setup-keys ()
;;   (evil-local-set-key 'normal (kbd "gk") 'a4b-org-babel-edit-previous)
;;   (evil-local-set-key 'normal (kbd "gj") 'a4b-org-babel-edit-next))

(defun a4b-org-babel/post-init-org ()
  ;; (add-hook 'evil-insert-state-entry-hook 'a4b-org-babel-entering-insert nil t)
  ;; (add-hook 'evil-insert-state-exit-hook 'a4b-org-babel-exiting-insert nil t)
  (evil-define-minor-mode-key 'normal 'org-src-mode
    (kbd "gk") 'a4b-org-babel-edit-previous)
  (evil-define-minor-mode-key 'normal 'org-src-mode
    (kbd "gj") 'a4b-org-babel-edit-next)
  (message "a4b org babel --------------------"))
  ;(add-hook 'org-src-mode-hook #'a4b-org-babel-setup-keys))
  

