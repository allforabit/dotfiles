;;; init.el -*- lexical-binding: t; -*-

(setq +org-dir "~/Documents/Bitbucket/org/")

;; TODO not sure if this all needs to go in here
(after! org
  ;; TODO Figure out how to get this to work
  ;; This isn't working and is taking over other modes
  ;; (map! (:mode org-mode (:map ivy-mode-map
  ;;       [remap imenu] #'counsel-org-goto)))
  (setq org-ellipsis "…"))

(setq org-default-notes-file (concat +org-dir "notes.org")
      org-capture-templates
      '(("t" "Todo" entry
         (file+headline (expand-file-name "gtd.org" +org-dir) "Inbox")
         "* [ ] %?\n%i" :prepend t :kill-buffer t)
        ("c" "Code journal" entry (file+olp+datetree "~/Bitbucket/org/code.org" "Journal")
         "* %?\nEntered on %U\n  %i\n  %a"
         :jump-to-captured t)
        ("n" "Notes" entry
         (file+headline org-default-notes-file "Inbox")
         "* %u %?\n%i" :prepend t :kill-buffer t)))
