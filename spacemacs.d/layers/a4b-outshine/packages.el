;;; packages.el --- outshine layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; * code

;; ** package include

(defconst a4b-outshine-packages
  '(outshine outorg navi-mode))

;; ** init job
;; adapted from
;; https://github.com/syl20bnr/spacemacs/issues/5258
;; http://spacemacs.org/doc/LAYERS.html#funcsel
;; https://github.com/syl20bnr/spacemacs/issues/7388#issuecomment-253602911

(defun a4b-outshine/init-outshine ()
  ;; To define the outline-minor-mode-prefix key before the package is loaded
  (defvar outline-minor-mode-prefix "\M-#")
  ;; Setup outshine
  (use-package outshine)
  (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
  (add-hook 'prog-mode-hook 'outline-minor-mode))

(defun a4b-outshine/init-outorg ()
  ;; Setup outorg
  (use-package outorg))

(defun a4b-outshine/init-navi-mode ()
  ;; Setup navi-mode
  (use-package navi-mode))
;;; packages.el ends here
