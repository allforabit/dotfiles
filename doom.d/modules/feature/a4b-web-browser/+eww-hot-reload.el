;;; +eww-hot-reload.el --- EWW hot reload effort -*- lexical-binding: t; -*-

;; From here: https://emacs.stackexchange.com/questions/2426/how-do-i-auto-refresh-eww-pages

(defvar modi/eww--file-notify-descriptors-list ()
  "List to store file-notify descriptor for all files that have an
associated auto-reloading eww buffer.")

(defun modi/advice-eww-open-file-to-auto-reload (orig-fun &rest args)
  "When `eww-open-file' is called with \\[universal-argument], open
the file in eww and also add `file-notify' watch for it so that the eww
buffer auto-reloads when the HTML file changes."
  (prog1
      (apply orig-fun args)
    (when current-prefix-arg ; C-u M-x eww-open-file
      (require 'filenotify)
      (let ((file-name (car args)))
        (file-notify-add-watch file-name
                               '(change attribute-change)
                               #'modi/file-notify-callback-eww-reload)
        ;; Show the HTML file and its rendered form in eww side-by-side
        (find-file-other-window file-name))
      ;; Redefine the `q' binding in `eww-mode-map'
      (bind-key "q" #'modi/eww-quit-and-update-fn-descriptors eww-mode-map))))
(advice-add 'eww-open-file :around #'modi/advice-eww-open-file-to-auto-reload)

(defun modi/file-notify-callback-eww-reload (event)
  "On getting triggered, switch to the eww buffer, reload and switch
back to the working buffer. Also save the `file-notify-descriptor' of the
triggering event."
  (let* ((working-buffer (buffer-name)))
    (switch-to-buffer-other-window "eww")
    (eww-reload)
    (switch-to-buffer-other-window working-buffer))
  ;; `(car event)' will return the event descriptor
  (add-to-list 'modi/eww--file-notify-descriptors-list (car event)))

(defun modi/eww-quit-and-update-fn-descriptors ()
  "When quitting `eww', first remove any saved file-notify descriptors
specific to eww, while also updating `modi/eww--file-notify-descriptors-list'."
  (interactive)
  (dotimes (index (safe-length modi/eww--file-notify-descriptors-list))
    (file-notify-rm-watch (pop modi/eww--file-notify-descriptors-list)))
  (quit-window :kill))


(require 'filenotify)

(defun my-notify-callback (event)
  (message "Event yo %S" event))


(setq my-watch (file-notify-add-watch
 "~/Desktop" '(change attribute-change) 'my-notify-callback))


(write-region "foo 2" nil "~/Desktop/foo")

(write-region "bla" nil "~/Desktop/bar")

(set-file-modes "~/Desktop/foo" (default-file-modes))

(delete-file "~/Desktop/bar")
(delete-file "~/Desktop/foo")

(file-notify-rm-watch my-watch)

(add-hook 'eww-mode-hook
          (lambda ()
            (message "Adding revert functions")
            (setq-local buffer-stale-function
                        #'(lambda (&optional noconfirm) 'fast))
            (setq-local revert-buffer-function
                        #'(lambda (&rest -) (eww-reload)))))

(defun my-switch-to-url-buffer (status)
  (message "Oh hi there")
  (message status))

(url-retrieve "http://localhost:3000" 'my-switch-to-url-buffer))

(with-current-buffer
    (url-retrieve-synchronously "http://localhost:3000")
  (goto-char (point-min))
  (buffer-string))

;; TODO install request & refine

(require 'request)
(request
 "http://httpbin.org/status/400"     ; try other codes, for example:
 ;; "http://httpbin.org/status/200"  ; success callback will be called.
 ;; "http://httpbin.org/status/400"  ; you will see "Got 400."
 :parser 'buffer-string
 :success
 (cl-function (lambda (&key data &allow-other-keys)
                (when data
                  (with-current-buffer (get-buffer-create "*request demo*")
                    (erase-buffer)
                    (insert data)
                    (pop-to-buffer (current-buffer))))))
 :error
 (cl-function (lambda (&rest args &key error-thrown &allow-other-keys)
                (message "Got error: %S" error-thrown)))
 :complete (lambda (&rest _) (message "Finished!"))
 :status-code '((400 . (lambda (&rest _) (message "Got 400.")))
                (418 . (lambda (&rest _) (message "Got 418.")))))
