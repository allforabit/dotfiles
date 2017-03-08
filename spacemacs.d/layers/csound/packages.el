(defconst csound-packages
  '(
    (csound-mode :location local)
    (ob-csound :location local)
    ))


(defvar csound-output-file "~/Desktop/csound/2017/subtract/sweepy.wav")

(defun csound-render-csound ()
  "Run csound on current buffer"
  (interactive)
  (save-buffer)
  (message "Render")
  (shell-command
   ;; command and parameters
   (concat "csound \"" buffer-file-name "\" -d"))
  (shell-command
   ;; command and parameters
   (concat "sox " csound-output-file " -n spectrogram" ))
  (shell-command
    "rm -rf wave.png")
  (shell-command
   (concat "ffmpeg -i " csound-output-file " -filter_complex \"showwavespic=s=800x240\" -frames:v 1 wave.png"))
  (evil-window-right 1)
  (when org-inline-image-overlays
    (org-redisplay-inline-images))
  (evil-window-left 1)
  )

(defun csound-play-sound ()
  "Run csound on current buffer"
  (interactive)
  (message "Play")

  (shell-command
   ;; command and parameters
   (concat "/Applications/VLC.app/Contents/MacOS/VLC --no-repeat --no-loop --intf dummy " csound-output-file ))
  )

(defun csound-run-csound-bck ()
  "Run csound on current buffer"
  (interactive)
  (save-buffer)
  (message "Yo there")
  (shell-command
   ;; command and parameters
   (concat "csound \"" buffer-file-name "\"")))

(defun csound-run-csound ()
  "Run csound on current buffer"
  (interactive)
  (message "Run")
  (csound-render-csound)
  (redisplay)
  (csound-play-sound)
  )

(defun csound/init-csound-mode ()
  "Initialize stef elisp (csound package)"

  (use-package csound-mode
    :init
    (progn

      (message "Starting csound mode")

      (global-set-key (kbd "s-r") 'csound-run-csound)
      (global-set-key (kbd "M-f") 'csound-render-csound)
      (global-set-key (quote [f9]) 'csound-play-sound)

      )
    )
  )

(defun csound/init-ob-csound ()
  "Initialize stef elisp (csound package)"
  (use-package ob-csound
    :init
    (progn
      (message "Starting ob csound")
      )
    )
  )
