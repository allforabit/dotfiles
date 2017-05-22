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
  '()
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





;;; packages.el ends here

(defun a4b-org-babel-entering-insert ()
  (print "entering insert mode")
  (narrow-to-defun))


(defun a4b-org-babel-exiting-insert ()
  (print "exiting insert mode")
  (widen))

;; (defun a4b-org-babel/post-init-org ()
;;   (add-hook 'org-mode-hook
;;             (lambda ()
;;               (progn
;;                 (add-hook 'evil-insert-state-entry-hook 'a4b-org-babel-entering-insert nil t)
;;                 (add-hook 'evil-insert-state-exit-hook 'a4b-org-babel-exiting-insert nil t)))))

