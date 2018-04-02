;;; private/allforabit/+bindings.el -*- lexical-binding: t; -*-

(defun spacemacs/helm-jump-in-buffer ()
  "Jump in buffer using `imenu' facilities and helm."
  (interactive)
  (call-interactively
   (cond
    ((eq major-mode 'org-mode) 'helm-org-in-buffer-headings)
    (t 'helm-semantic-or-imenu))))

(defun spacemacs/alternate-buffer-in-persp ()
  "Switch back and forth between current and last buffer in the
  current perspective."
  (interactive)
  (with-persp-buffer-list ()
                          (switch-to-buffer (other-buffer (current-buffer) t))))

(defun spacemacs/persp-helm-mini ()
  "As `helm-mini' but restricts visible buffers by perspective."
  (interactive)
  (with-persp-buffer-list ()
                          (helm-mini)))

(map!
 (:leader
   :desc "Execute extended command"    :n "SPC" #'execute-extended-command
   :desc "Switch to last buffer" :n "TAB"   #'spacemacs/alternate-buffer-in-persp
   (:desc "buffer" :prefix "b"
     :desc "Switch workspace buffer" :n "b" #'persp-switch-to-buffer
     :desc "Kill buffer"             :n "d" #'kill-this-buffer)

   (:desc "eval" :prefix "e"
     :desc "List errors"               :n  "x" #'flycheck-list-errors
     :desc "Evaluate buffer/region"    :n  "e" #'+eval/buffer
                                       :v  "e" #'+eval/region
     :desc "Evaluate & replace region" :nv "E" #'+eval:replace-region
     :desc "Build tasks"               :nv "b" #'+eval/build
     :desc "Jump to definition"        :n  "d" #'+jump/definition
     :desc "Jump to references"        :n  "D" #'+jump/references
     :desc "Open REPL"                 :n  "r" #'+eval/open-repl
                                       :v  "r" #'+eval:repl)
   ;; TODO may not be the best use of j prefix
   (:desc "Jumping" :prefix "j"
     :desc "Jump in" :nv "i" #'imenu
     :desc "Jump in" :nv "I" #'imenu-anywhere
     :desc "Jump to" :nv "j" #'evil-avy-goto-char
     :desc "Jump to 2 char" :nv "J" #'evil-avy-goto-char-2)

   (:desc "File" :prefix "f"
     :desc "Save file" :nv "s" #'save-buffer
     :desc "Find file" :nv "f" #'counsel-find-file)

   ;; Change to spacemacs prefix
   (:desc "workspace" :prefix "l"
     :desc "Display tab bar"          :n "TAB" #'+workspace/display
     :desc "New workspace"            :n "n"   #'+workspace/new
     :desc "Restore workspace from file" :n "r"   #'+workspace/load
     :desc "Restore last session"        :n "R"   (λ! (+workspace/load-session))
     :desc "Save workspace to file"   :n "s"   #'+workspace/save
     :desc "Autosave current session" :n "S"   #'+workspace/save-session
     :desc "Switch workspace"         :n "l"   #'+workspace/switch-to
     :desc "Kill all buffers"         :n "x"   #'doom/kill-all-buffers
     :desc "Delete session"           :n "X"   #'+workspace/kill-session
     :desc "Delete this workspace"    :n "d"   #'+workspace/delete
     :desc "Load session"             :n "L"   #'+workspace/load-session
     :desc "Next workspace"           :n "]"   #'+workspace/switch-right
     :desc "Previous workspace"       :n "["   #'+workspace/switch-left
     :desc "Switch to 1st workspace"  :n "1"   (λ! (+workspace/switch-to 0))
     :desc "Switch to 2nd workspace"  :n "2"   (λ! (+workspace/switch-to 1))
     :desc "Switch to 3rd workspace"  :n "3"   (λ! (+workspace/switch-to 2))
     :desc "Switch to 4th workspace"  :n "4"   (λ! (+workspace/switch-to 3))
     :desc "Switch to 5th workspace"  :n "5"   (λ! (+workspace/switch-to 4))
     :desc "Switch to 6th workspace"  :n "6"   (λ! (+workspace/switch-to 5))
     :desc "Switch to 7th workspace"  :n "7"   (λ! (+workspace/switch-to 6))
     :desc "Switch to 8th workspace"  :n "8"   (λ! (+workspace/switch-to 7))
     :desc "Switch to 9th workspace"  :n "9"   (λ! (+workspace/switch-to 8))
     :desc "Switch to last workspace" :n "0"   #'+workspace/switch-to-last)

   (:when IS-WINDOWS
     (:desc "open" :prefix "o"
       :desc "Terminal"              :n  "t" #'+eshell/open-popup
       :desc "Terminal in project"   :n  "T" #'projectile-run-eshell))

   (:desc "project" :prefix "p"
          :desc "Pop term in project"     :n  "o" #'projectile-run-eshell)

   )
(:map evil-window-map ; prefix "C-w"
        "C"     #'ace-delete-window)

  (:map evil-window-map ; prefix "C-w"
        "C"     #'ace-delete-window)

  ;; ivy
  ;; May not need to redefine all these
  (:after ivy
    :map ivy-minibuffer-map
    "C-h" #'ivy-backward-delete-char)


  ;; Add j/k bindings
  (:after company
    (:map company-active-map
      ;; Don't interfere with `evil-delete-backward-word' in insert mode
      "C-w"        nil
      "C-o"        #'company-search-kill-others
      "C-j"        #'company-select-next
      "C-k"        #'company-select-previous
      "C-l"        #'company-complete-selection)
    ;; Automatically applies to `company-filter-map'
    (:map company-search-map
      "C-j"        #'company-search-repeat-forward
      "C-k"        #'company-search-repeat-backward)))
