;;; packages.el --- processing layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Kevin Nolan <kevin@MacBook-Air-4.local>
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
;; added to `processing-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `processing/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `processing/pre-init-PACKAGE' and/or
;;   `processing/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst processing-packages
  '(processing-mode)
  "The list of Lisp packages required by the processing layer.

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
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; TODO move this to a better place, possibly variables.el
(defvar org-babel-processing-processing-js-filename "https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.6/processing.js"
  "Filename of the processing.js file.")

;;; packages.el ends here

(defun processing/init-processing-mode ()
  "Initialize stef elisp (csound package)"

  (use-package processing-mode
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'processing-mode
        "cc" 'processing-sketch-run))))
