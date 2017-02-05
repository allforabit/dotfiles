(defconst csound-x-packages
  '(
    (csound-mode :location local)
    ))


(defvar csound-x-output-file "~/Desktop/csound/2017/subtract/sweepy.wav")

(defun csound-x-render-csound ()
  "Run csound on current buffer"
  (interactive)
  (save-buffer)
  (message "Render")
  (shell-command
   ;; command and parameters
   (concat "csound \"" buffer-file-name "\" -d"))
  (shell-command
   ;; command and parameters
   (concat "sox " csound-x-output-file " -n spectrogram" ))
  (shell-command
    "rm -rf wave.png")
  (shell-command
   (concat "ffmpeg -i " csound-x-output-file " -filter_complex \"showwavespic=s=800x240\" -frames:v 1 wave.png"))
  (evil-window-right 1)
  (when org-inline-image-overlays
    (org-redisplay-inline-images))
  (evil-window-left 1)
  )

(defun csound-x-play-sound ()
  "Run csound on current buffer"
  (interactive)
  (message "Play")

  (shell-command
   ;; command and parameters
   (concat "/Applications/VLC.app/Contents/MacOS/VLC --no-repeat --no-loop --intf dummy " csound-x-output-file ))
  )

(defun csound-x-run-csound-bck ()
  "Run csound on current buffer"
  (interactive)
  (save-buffer)
  (message "Yo there")
  (shell-command
   ;; command and parameters
   (concat "csound \"" buffer-file-name "\"")))

(defun csound-x-run-csound ()
  "Run csound on current buffer"
  (interactive)
  (message "Run")
  (csound-x-render-csound)
  (redisplay)
  (csound-x-play-sound)
  )

(defun csound-x/init-csound-mode ()
  "Initialize stef elisp (csound package)"

  (use-package csound-mode
    :init
    (progn
      (message "Starting csound mode")

      (global-set-key (kbd "s-r") 'csound-x-run-csound)
      (global-set-key (kbd "M-f") 'csound-x-render-csound)
      (global-set-key (quote [f9]) 'csound-x-play-sound)

      )
    )
)
