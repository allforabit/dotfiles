;;; +git.el --- Git related config -*- lexical-binding: t; -*-


(defun a4b-git-pull-if-clean ()
  "Some stuff here."
  (interactive)
  (message (shell-command-to-string "
if [ -z '$(git status --porcelain)' ]; then
  echo 'clean'
  git pull
else
  echo 'dirty'
fi
")))

;; Make magit work
(set! :popup "^.*magit" '((slot . -1) (vslot . 1) (side . right) (size . 80)) '((select . t)))
(set! :popup "^\\*magit.*popup\\*" '((slot . 0) (vslot . 1) (side . right)) '((select . t)))
(set! :popup "^.*magit-revision:.*" '((slot . 2) (vslot . 1) (side . right) (window-height . 0.6)) '((select . t)))
(set! :popup "^.*magit-diff:.*" '((slot . 2) (vslot . 1) (side . right) (window-height . 0.6)) '((select)))
