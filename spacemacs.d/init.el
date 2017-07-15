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
     windows-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     evil-snipe
     colors
     (javascript
      :variables
      js-indent-level 2
      )
     helm
     (auto-completion
      :variables
      auto-completion-return-key-behavior nil
      auto-completion-complete-with-key-sequence  "jk"
      ;; auto-completion-enable-snippets-in-popup t
      yas-snippet-dirs '("/Users/kevin/.spacemacs.d/snippets" yas-installed-snippets-dir "/Users/kevin/.emacs.d/layers/+completion/auto-completion/local/snippets"))
     better-defaults
     emacs-lisp
     python
     (clojure
      :variables
      cider-cljs-lein-repl "(do (start) (cljs))"
      clojure-enable-fancify-symbols nil
      )
     (react
      :variables
      ;; js2-mode
      js2-basic-offset 2
      ;; web-mode
      css-indent-offset 2
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-attr-indent-offset 2
      )
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
      org-src-window-setup 'other-window
      org-agenda-files '("~/Google Drive/Projects/sonicsketch/README.org"
                         "~/Google Drive/Projects/sonicsketch/src/sonicsketch/core.org")
      org-agenda-window-setup 'current-window
      helm-org-format-outline-path t

      org-capture-templates '(("c" "Code composition sketch" entry (file+datetree "~/Google Drive/Projects/sketchbook/index.org")
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
     (gnus
      :variables
      gnus-secondary-select-methods
      '(
        (nntp "gmane"
              (nntp-address "news.gmane.org"))
        (nntp "news.eternal-september.org")
        (nntp "nntp.aioe.org")
        (nntp "news.gwene.org")))


     (plantuml :variables
               org-plantuml-jar-path (expand-file-name "~/.spacemacs.d/plantuml.jar")
               plantuml-jar-path (expand-file-name "~/.spacemacs.d/plantuml.jar"))

     graphviz

     spacemacs-purpose


     ;; To improve dired (tpope)
     vinegar
     mu4e

     ;; Extra languages (including arduino)
     extra-langs
     autohotkey

     ;; Custom
     nyquist
     a4b-misc
     a4b-lisp
     a4b-clojure
     a4b-org-babel
     a4b-outshine
     (processing :variables
                 processing-location "/usr/local/bin/processing-java"
                 processing-application-dir "/Applications/Processing.app"
                 processing-sketchbook-dir "~/Documents/Processing")

     lilypond
     csound
     ;; writeroom
     zotero
     polymode
     )
   )
  ;; ----------------------------------------------------------------
  ;; These list layers to load on specific platforms or systems
  ;; ----------------------------------------------------------------
  (setq
   ;; Layers to be loaded only on Microsoft Windows
   a4b--windows-nt-layers
   '(
     (javascript
      :variables
      js-indent-level 2
      ;; tern-command '("node.exe" "c:/Users/Admin/AppData/Roaming/npm/tern.cmd")
      )
     )
   ;; Layers to be loaded only on Macintosh
   a4b--darwin-layers
   '(
     (javascript
      :variables
      js-indent-level 2
      )
     )
   ;; Layers to be loaded only on GNU/Linux
   a4b--gnu/linux-layers
   '(
     )
   ;; Layers common to Unix systems
   a4b--nix-layers
   '(
     )
   ;; Layers to be loaded only on Work computers
   a4b--work-layers
   '(
     )
   ;; A list of system-names I use at work
   ;; Whenever I install spacemacs to a new system, add it's `system-name'
   a4b--work-systems
   '()
   )
  ;; ----------------------------------------------------------------
  ;; now append the layers lists depending on what the system is
  ;; ----------------------------------------------------------------

  ;; arrange layers lists first
  (setq  a4b--layers dotspacemacs-configuration-layers)
  (setq a4b--darwin-layers
        (append a4b--darwin-layers a4b--nix-layers)
        a4b--gnu/linux-layers
        (append a4b--gnu/linux-layers a4b--nix-layers))

  (cond ((eq system-type 'windows-nt)
         (setq a4b--layers (append a4b--layers a4b--windows-nt-layers)))
        ((eq system-type 'darwin)
         (setq a4b--layers (append a4b--layers a4b--darwin-layers)))
        ((eq system-type 'gnu/linux)
         (setq a4b--layers (append a4b--layers a4b--gnu/linux-layers))))
  (when (member (car (split-string system-name "\\.")) a4b--work-systems)
    (setq a4b--layers (append a4b--layers a4b--work-layers)))

  (setq-default
   ;; ----------------------------------------------------------------
   ;; Now just set the master layers list from `a4b-layers' appended above
   ;; ----------------------------------------------------------------
   dotspacemacs-configuration-layers a4b--layers
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-switch-to-buffer-prefers-purpose t
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(lentic auto-dim-other-buffers)
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

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((bookmarks . 5)
                                (recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         leuven)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

;; TODO move
(defun a4b-translate-C-i (_prompt)
  (if (and (= (length (this-command-keys-vector)) 1)
           (= (aref (this-command-keys-vector) 0) ?\C-i)
           (bound-and-true-p evil-mode)
           (eq evil-state 'normal))
      (kbd "<C-i>")
    (kbd "TAB")))

;; Tangle Org files when we save them
;; (defun tangle-on-save-org-mode-file()
;;   (when (string= (message "%s" major-mode) "org-mode")
;;     (org-babel-tangle)))

;; Temporary fix for figwheel with org babel
;; TODO report on figwheel issue queue
;; -----------------------------------------------------
(defun a4b-figwheel-temp-fix (orig-fun &rest args)
  ;; (write-region " " nil (first args) 'append)
  (let ((res (apply orig-fun args))
        res)))
;; -----------------------------------------------------


(defun a4b-save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Make image refresh work (e.g. for plantuml mode)
  ;; https://emacs.stackexchange.com/questions/2303/making-an-image-ie-image-mode-auto-reload-changes-from-disk
  (add-hook 'image-mode-hook (lambda ()
                               (auto-revert-mode 1)
                               (auto-image-file-mode 1)))

  (set-language-environment 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  (add-to-list 'purpose-user-mode-purposes '(cider-repl-mode . repl))
  (purpose-compile-user-configuration) ; activates your changes

  (advice-add 'delete-file :around #'a4b-figwheel-temp-fix)

  ;; (add-hook 'after-save-hook 'tangle-on-save-org-mode-file)

  (setenv "PATH"
          (concat
           "C:\\cygwin64\\bin" ";"
           (getenv "PATH")))

  (spacemacs/set-leader-keys-for-major-mode 'processing-mode
    "cc" 'processing-sketch-run)

  (define-key org-src-mode-map (kbd "C-]") 'forward-char)

  (spacemacs/set-leader-keys-for-minor-mode 'org-src-mode
    "fs" 'org-edit-src-save)

  (spacemacs/set-leader-keys "fa" 'a4b-save-buffer-always)

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
     (plantuml . t)
     (latex . t)
     (processing . t)
     ;; (javascript . t)
     (python . t)))

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
 '(safe-local-variable-values
   (quote
    ((eval progn
           (temp-mode 1)
           (define-key temp-mode-map
             (kbd "<f5>")
             (lambda nil
               (interactive)
               (cider-interactive-eval "(re-frame.core/dispatch [:play-pause])"))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
