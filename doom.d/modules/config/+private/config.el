;;; private/allforabit/config.el -*- lexical-binding: t; -*-
;;(def-package! webkit-color-picker
;;  :ensure t
 ;; :commands (webkit-color-picker-show))

;; Project list for use by prodigy / doom projects
(setq a4b-project-file '("~/Bitbucket/org/projects.el"))

;; Disable for now
;; (setq gac-automatically-push-p t)
;; (def-package! git-auto-commit-mode
;;   :config
;;   ;; Push automatically
;;   )


;; temp-mode.el
;; Temporary minor mode
;; Main use is to enable it only in specific buffers to achieve the goal of
;; buffer-specific keymaps

;; (defvar temp-mode-map (make-sparse-keymap)
;;   "Keymap while temp-mode is active.")

;; ;;;###autoload
;; (define-minor-mode temp-mode
;;   "A temporary minor mode to be activated only specific to a buffer."
;;   nil
;;   :lighter " Temp"
;;   temp-mode-map)

;; Source: https://emacs.stackexchange.com/questions/519/key-bindings-specific-to-a-buffer
;; Usage:
;; eval: (temp-mode 1)
;; eval: (define-key temp-mode-map (kbd "<f10>") 'function-ONE)
;; (def-package! fakecygpty
;;   :config
;;   (message "Activating Fake cyg pty")
;;   (fakecygpty-activate))

;; (make-comint-in-buffer "cmd" nil "cmd" nil)
;; (setq explicit-shell-file-name "c:/msys64/usr/bin/bash.exe")
;; (setq shell-file-name explicit-shell-file-name)
;; (after! prodigy
;;   (load (concat +org-dir "+projects.el")))

;; (setq +lookup-open-url-fn 'eww)
;; TODO remove / make more generic
;; (setenv "NODE_PATH"
;;         (concat
;;          "~/Documents/Bitbucket/org/node_modules" ":"
;;          (getenv "NODE_PATH")
;;          )
;;         )

;; (def-package! pdf-tools
;;   :if (display-graphic-p)
;;   :mode ("\\.pdf$" . pdf-view-mode)
;;   :init (load "pdf-tools-autoloads" nil t)
;;   :config (pdf-tools-install))


;; (def-package! ob-async)
;; ;; (def-package! ob-clojure-literate)

;; ;; TODO figure out how it works and re-enable
;; ;; (after! org
;; ;;   (setq ob-clojure-literate-auto-jackin-p t)
;; ;;   (add-hook 'org-mode-hook #'ob-clojure-literate-mode))
(def-package! firestarter
:config
  ;; Start by default
  (firestarter-mode))
(put 'firestarter 'safe-local-variable 'identity)

;; (def-package! xmlgen)

;; ;; Image refresh fix
;; ;; https://emacs.stackexchange.com/questions/2303/making-an-image-ie-image-mode-auto-reload-changes-from-disk
;; (add-hook 'image-mode #'auto-image-file-mode)

;; ;; UTF-8 everywhere
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; (def-package! list-processes+)


;; (def-package! emacs-snippets
;;   :after yasnippet
;;   :config
;;   (delete yas--default-user-snippets-dir yas-snippet-dirs)
;;   ;; Personal emacs snippets (probably shouldn't be used in favour of emacs
;;   ;; snippets package)
;;   (add-to-list 'yas-snippet-dirs "~/Documents/Github/dotfiles/emacs/snippets"))

;; Make it possible to add hashes and euro symbols
;; (setq mac-right-option-modifier nil)
;; from modules/completion/company/config.el
;; Drupal mode

(def-package! drupal-mode)

(def-package! psysh)
(def-package! livid-mode)
;; (def-package! ob-php)

(load! +bindings)  ; my key bindings
(load! +git)
(when IS-WINDOWS
  (load! +windows))

;;
;; (after! doom-themes
;;   ;; Since Fira Mono doesn't have an italicized variant, highlight it instead
;;   (set-face-attribute 'italic nil
;;                       :weight 'ultra-light
;;                       :foreground "#ffffff"
;;                       :background (doom-color 'current-line)))


;; (setq org-babel-clojure-backend 'cider)

;; ;; app/email
;; (after! mu4e
;;   (setq smtpmail-stream-type 'starttls
;;         smtpmail-default-smtp-server "smtp.gmail.com"
;;         smtpmail-smtp-server "smtp.gmail.com"
;;         smtpmail-smtp-service 587)

;;   (set! :email "gmail.com"
;;     '((mu4e-sent-folder       . "/gmail.com/Sent Mail")
;;       (mu4e-drafts-folder     . "/gmail.com/Drafts")
;;       (mu4e-trash-folder      . "/gmail.com/Trash")
;;       (mu4e-refile-folder     . "/gmail.com/All Mail")
;;       (smtpmail-smtp-user     . "kevnolan")
;;       (user-mail-address      . "kevnolan@gmail.com")
;;       (mu4e-compose-signature . "---\nKevin Nolan")))
;;   )

(after! evil-escape
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-excluded-major-modes '(neotree-mode)
        evil-escape-key-sequence "fd"
        evil-escape-delay 0.25))

;; ;; Will need to be more specific
;; (def-project-mode! +web-thing-mode
;;   :modes (js2-mode typescript-mode)
;;   :files (and "webpack.config.js" "tsconfig.json"))

;; ;; Again will need to be more specific
;; (def-project-mode! +web-tachyons-mode
;;   :modes (js2-mode typescript-mode)
;;   :files (and "webpack.config.js" "tsconfig.json"))

;; (def-package! ahk-mode)


;; (when (window-parameter nil 'window-side)
;;   (select-window
;;    (cl-loop for win in (window-list)
;;             unless (window-parameter win 'window-side)
;;             return win)))
;; (add-hook 'persp-before-deactivate-functions #'+workspaces|select-non-side-window)

;;   (when (window-parameter nil 'window-side)
;;     (select-window
;;      (cl-loop for win in (window-list)
;;               unless (window-parameter win 'window-side)
;;               return win))))
;; (add-hook 'persp-before-deactivate-functions #'+workspaces|select-non-side-window)


(def-package! request)
(def-package! refine
  :commands (refine))
