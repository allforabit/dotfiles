;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()

  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (javascript
      :variables
      js2-basic-offset 2
      js-indent-level 2
      tern-command '("node" "c:/users/admin/AppData/Roaming/npm/node_modules/tern/bin/tern"))
     helm
     auto-completion
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      yas-snippet-dirs '("/Users/kevin/.spacemacs.d/snippets" yas-installed-snippets-dir "/Users/kevin/.emacs.d/layers/+completion/auto-completion/local/snippets"))
     better-defaults
     emacs-lisp
     python
     (clojure
      :variables
      cider-cljs-lein-repl "(do (start) (cljs))")
     react
     html
     git
     markdown
     (org
      :variables
      ;; org-bullets-bullet-list '("■" "◆" "▲" "▶")
      org-babel-clojure-backend 'cider
      org-latex-to-pdf-process (list "latexmk -pdf %f")
      org-enable-reveal-js-support t
      org-reveal-root "file:///Users/kevin/Google%20Drive/reveal.js"
      org-id-link-to-org-use-id t
      org-confirm-babel-evaluate nil
      org-src-window-setup 'current-window
      helm-org-format-outline-path t

      org-capture-templates '(
                              ("c" "Code composition sketch" entry (file+datetree "~/Google Drive/Projects/sketchbook/index.org")
                               "* %?\nEntered on %U\n  %i\n  %a")

                              ("j" "Journal entry" plain (file+datetree "~/Google Drive/org/personal/journal.org")
                               "* %?\nEntered on %U\n  %i\n  %a")))
     pandoc
     ;; (pdf-tools
     ;;  :variables
     ;;  pdf-tools-handle-upgrades nil
     ;;  pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")

     latex
     ;; For now configured for thesis
     (bibtex :variables
             org-ref-default-bibliography '("~/Google Drive/bibliography/references.bib")
             org-ref-pdf-directory "~/Google Drive/Projects/mmt-thesis/ref/"
             org-ref-bibliography-notes "~/Google Drive/bibliography/notes.org")

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     ;; spell-checking
     syntax-checking
     version-control
     html
     ;; (osx :variables
     ;;      mac-right-option-modifier nil)
     haskell
     ruby
     faust
     autohotkey
     (gnus
      :variables
      gnus-secondary-select-methods
      '(
        (nntp "gmane"
              (nntp-address "news.gmane.org"))
        (nntp "news.eternal-september.org")
        (nntp "nntp.aioe.org")
        (nntp "news.gwene.org")))


     graphviz

     ;; To improve dired (tpope)
     vinegar
     mu4e

     ;; Extra languages (including arduino)
     extra-langs

     ;; Custom
     nyquist
     a4b-lisp
     a4b-clojure
     a4b-polymode
     a4b-org-babel
     (processing :variables
                 processing-location "/usr/local/bin/processing-java"
                 processing-application-dir "/Applications/Processing.app"
                 processing-sketchbook-dir "~/Documents/Processing")

     lilypond
     csound
     writeroom
     zotero)
   
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(leuven-theme)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))


(defun a4b-figwheel-temp-fix (orig-fun &rest args)
  (message "delete called %S" args)
  (let ((res (apply orig-fun args)))
    res))

;; Tangle Org files when we save them
(defun a4b-tangle-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-babel-tangle)))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default)
   ;; If non nil ELPA repositories are contacted via   ;; -----------------------------------------------------

  (advice-add 'delete-file :around #'a4b-figwheel-temp-fix)
  ;; -----------------------------------------------------

  (add-hook 'after-save-hook 'tangle-on-save-org-mode-file)

  (setenv "PATH"
          (concat
           "C:\\cygwin64\\bin" ";"
           (getenv "PATH")))

  (spacemacs/set-leader-keys-for-major-mode 'processing-mode
    "cc" 'processing-sketch-run)

  (define-key org-src-mode-map (kbd "C-]") 'forward-char)


  (add-hook 'after-save-hook 'a4b-tangle-on-save-org-mode-file)

  (spacemacs/set-leader-keys-for-minor-mode 'org-src-mode
    "fs" 'org-edit-src-save)

  (setq compilation-read-command nil)

  ;; Fix <C-i> to make it jump forward properly vi style
  ;; TODO submit as fix to evil-mode???
  (define-key key-translation-map (kbd "TAB") 'a4b-translate-C-i)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "<C-i>") 'evil-jump-forward))

  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "vt" 'org-babel-tangle)

  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "<C-i>") 'evil-jump-forward))


  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'spacemacs/toggle-visual-line-navigation-on)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((haskell . t)
     (emacs-lisp . t)
     (lilypond . t)
     (ruby . t)
     (csound . t)
     (clojure . t)
     (dot . t)
     (latex . t)
     (processing . t)
     ;; (javascript . t)
     (python . t)))

  ;; (require 'mmm-mode)
  ;; (setq mmm-global-mode 'maybe)

  ;; (mmm-add-mode-ext-class 'org-mode nil 'org-elisp)
  ;; (mmm-add-mode-ext-class 'org-mode nil 'org-clojurescript)

  ;; (mmm-add-group
  ;;  'org-clojurescript
  ;;  '((clojurescript-src-block
  ;;     :submode clojurescript-mode
  ;;     :face org-block
  ;;     :front "#\\+BEGIN_SRC clojurescript.*\n"
  ;;     :back "#\\+END_SRC")))

  ;; (mmm-add-group
  ;;  'org-elisp
  ;;  '((elisp-src-block
  ;;     :submode emacs-lisp-mode
  ;;     :face org-block
  ;;     :front "#\\+BEGIN_SRC emacs-lisp.*\n"
  ;;     :back "#\\+END_SRC")))

  ;; Backup files
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-cljs-lein-repl "(do (start) (cljs))")
 '(cider-lein-command "lein")
 '(package-selected-packages
   (quote
    (polymode leuven-theme zotelo yapfify xterm-color writeroom-mode visual-fill-column wolfram-mode web-mode web-beautify unfill thrift tagedit stan-mode smeargle slim-mode shell-pop scss-mode scad-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder rbenv rake qml-mode pyvenv pytest pyenv-mode py-isort pug-mode processing-mode pip-requirements pbcopy parinfer pandoc-mode ox-reveal ox-pandoc osx-trash osx-dictionary orgit org-ref key-chord org-projectile org-present org-pomodoro org-download mwim multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp mmm-mode minitest matlab-mode markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode lispy zoutline swiper ivy less-css-mode launchctl julia-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc intero hy-mode htmlize hlint-refactor hindent helm-pydoc helm-hoogle helm-gitignore helm-css-scss helm-company helm-c-yasnippet helm-bibtex parsebib haskell-snippets haml-mode graphviz-dot-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck faust-mode evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help emmet-mode diff-hl cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-auctex company-anaconda company coffee-mode cmm-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider queue clojure-mode chruby bundler inf-ruby biblio biblio-core auto-yasnippet yasnippet auto-dictionary auctex arduino-mode anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces)
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
