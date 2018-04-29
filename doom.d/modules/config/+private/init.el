;;; init.el --- Private init -*- lexical-binding: t; -*-

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

