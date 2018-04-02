;;; private/allforabit/init.el -*- lexical-binding: t; -*-

(doom!
 :feature
 ;; TODO this should be called browser
 +browser
 :lang
 +php
 :config
 ;; Enable doom modules
 ;; This file resembled default config as much as possible to make diffing easier after upgrades
 +doom
 ;; +bindings
 )


;; To fix node modules??
;; Maybe should be only added in special circumstances
(setq org-babel-temporary-directory "~/Documents/Bitbucket/org/tmp")
;; TODO this slow down startup

(unless (file-directory-p org-babel-temporary-directory)
  (make-directory org-babel-temporary-directory))

(defvar +org-babel-languages
  '(calc
    clojure
    css
    emacs-lisp
    haskell
    ;; browser
    js
    ;; typescript
    latex
    ledger
    lilypond
    lisp
    matlab
    plantuml
    python
    ;; restclient ; ob-restclient
    ruby
    rust       ; ob-rust
    shell
    sqlite
    sql-mode   ; ob-sql-mode
    translate) ; ob-translate
  "A list of org-babel languages to load.")

;; I've swapped these keys on my keyboard
(setq x-super-keysym 'alt
      x-alt-keysym   'meta
      user-mail-address "kevnolan@gmail.com"
      user-full-name    "Kevin Nolan")


(def-package-hook! rtags :disable)

;; Org stuff
(setq +org-dir "~/Bitbucket/org/")

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

;; Use git bash for shell
;; TODO maybe should be msys2??
;; (setq explicit-shell-file-name
;;       "C:/Program Files (x86)/Git/bin/bash.exe")
;; (setq shell-file-name explicit-shell-file-name)
;; (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")

;; An extra measure to prevent the flash of unstyled mode-line while Emacs is
;; booting up (when Doom is byte-compiled).
;; (setq-default mode-line-format nil)
;; TODO try Fira Mono
(setq doom-big-font (font-spec :family "Source Code Pro" :size 19))
(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-variable-pitch-font (font-spec :family "Georgia")
      doom-unicode-font (font-spec :family "Symbola")
      ;; ui/doom-modeline
      +doom-modeline-height 23
      ;; `doom-themes'
      doom-neotree-enable-variable-pitch nil
      doom-neotree-project-size 1.2
      doom-neotree-line-spacing 0
      doom-neotree-folder-size 1.0
      doom-neotree-chevron-size 0.6)
