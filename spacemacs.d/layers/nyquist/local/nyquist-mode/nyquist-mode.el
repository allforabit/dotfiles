;; init-nyquist.el
;; Version 0.01 18-Aug-2005
;;
;; Establish Nyquist as an inferior lisp process in emacs,
;;

(setq *nyquist-buffer* "*ny*")                 ; Name of nyquist buffer
(setq *nyquist-program* "ny")         ; Name of nyquist executable
(setq *nyquist-process-name* "inferior-lisp")  ; Emacs name for nyquist process

(setq inferior-lisp-buffer *nyquist-buffer*)
(setq inferior-lisp-program *nyquist-program*)


;; Start an asynchronius Nyquist process in inferior-lisp-mode.
;; The process initially runs in buffer "*inferior-lisp*" but the buffer
;; is immediatley renamed to "*ny*" 
;; 
;; We also bind the start-nyquist function to shifted function key F12.
;;
(defun start-nyquist ()
  "Start new nyquist process"
  (interactive)
  (run-lisp *nyquist-program*)
  (global-set-key [S-f12] 'switch-to-nyquist)
  (switch-to-buffer "*inferior-lisp*")
  (rename-buffer *nyquist-buffer*)
  (setq inferior-lisp-buffer *nyquist-buffer*)
  (message "Nyquist started")
  )


;; Predicate test if nyquist process is currently running.
;; iff == "if and only iff"
;;
(defun nyquist-running-p ()
  "Return non-nill iff Nyquist process is running"
  (interactive)
  (get-process *nyquist-process-name*))


;; Switch to the buffer "*ny* if nyquist is currently running.
;; If Nyquist is not running, start it.
;;
(defun switch-to-nyquist ()
  "Switch to Nyquist buffer, if not running start new Nyquist"
  (interactive)
  (if (nyquist-running-p)
      (switch-to-buffer *nyquist-buffer*)
    (start-nyquist)))


;; Kill the nyquist process and the buffer it is running in.
;;
(defun kill-nyquist ()
  "Kill nyquist process and buffer"
  (interactive)
  (delete-process *nyquist-buffer*)
  (kill-buffer *nyquist-buffer*)
  (message "Nyquist killed"))


;; Delete (kill) all text in the Nyquist process buffer.
;; I bind this to C-backspace below.
;;
(defun clear-buffer()
  "Kill all text in current buffer"
  (interactive) 
  (clipboard-kill-region 1 (point-max)) 
  (begining-of-buffer))


(add-hook 'inferior-lisp-mode-hook
	  (lambda ()
	    (define-key inferior-lisp-mode-map [C-backspace] 'clear-buffer)))

(define-derived-mode nyquist-mode
  lisp-mode "nyquist"
  "Major mode for nyquist.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ny$" . nyquist-mode))

(provide 'nyquist-mode)
