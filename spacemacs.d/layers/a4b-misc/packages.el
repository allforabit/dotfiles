;;; packages.el --- a4b-misc layer packages file for Spacemacs.
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

;; Misc small packages and the likes...

;;; Code:

(defconst a4b-misc-packages
  '(
    (temp-mode :location local)
    )
  )


;;; packages.el ends here

(defun a4b-misc/init-temp-mode ()
  "Initialize temp mode package"
  (use-package temp-mode
    :init
    (progn
      (message "Temp mode init"))))

