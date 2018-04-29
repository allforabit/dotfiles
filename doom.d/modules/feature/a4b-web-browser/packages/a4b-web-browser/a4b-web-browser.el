;;; config.el --- A4b browser -*- lexical-binding: t; -*-


;; Filename: a4b-web-browser.el
;; Description: Running A4b-Web-Browser browser in Emacs (based on https://raw.githubusercontent.com/allforabit/emacs-webkit/master/webkit.el)
;; Author: Kevin Nolan <allforabit@gmail.com>
;; Maintainer: Andy Stewart <allforabit@gmail.com>

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Running A4b-Web-Browser browser in Emacs
;;

;;; Installation:
;;
;; NOTE: just a4b-web-browser.el can't work, you need install below depends first:
;;       * PyQt5:       http://www.riverbankcomputing.co.uk/software/pyqt/intro
;;       * Python-Xlib: https://pypi.python.org/pypi/python-xlib
;;       * Python-EPC:  https://github.com/tkf/python-epc
;;
;; Detail description please look: http://www.emacswiki.org/emacs/A4b-Web-Browser
;;
;; Then put a4b-web-browser.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'a4b-web-browser)
;;
;; Quick start:
;;
;; M-x a4b-web-browser-open-url
;;

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET a4b-web-browser RET
;;

;;; Change log:
;;
;; 2014/01/02
;;      * First released.
;;

;;; Acknowledgements:
;;
;Z;
;;

;;; TODO
;;
;;
;;

;;; Require

(require 'epc)

(when noninteractive
  (load "subr")
  (load "byte-run"))
(eval-when-compile (require 'cl))

;;; Code:

(defcustom a4b-web-browser-mode-hook '()
  "A4b-Web-Browser mode hook."
  :type 'hook
  :group 'a4b-web-browser-mode)

(defvar a4b-web-browser-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap used by `a4b-web-browser-mode'.")

(define-derived-mode a4b-web-browser-mode text-mode "A4b-Web-Browser"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'a4b-web-browser-mode)
  (setq mode-name "A4b-Web-Browser")
  (set (make-local-variable 'buffer-id) (a4b-web-browser-generate-id))
  (use-local-map a4b-web-browser-mode-map)
  (run-hooks 'a4b-web-browser-mode-hook))


(setq epc:accept-process-timeout 1500)
(setq epc:accept-process-timeout-count 1000)

;; (deferred:$
;;   (epc:call-deferred epc 'echo '("hello"))
;;   (deferred:nextc it
;;     (lambda (x) (message "Return : %S" x))))
(epc:stop-epc epc)
(setq epc (epc:start-epc "node" '("server.js")))

(defun a4b-web-browser-hello-world (msg) 
  (interactive)
  (setq a4b-eww-should-update t)
  (epc:call-sync epc 'helloWorld '(msg)))

(defun a4b-web-browser-scroll-to-y (ypos)
  (interactive "NYPos: ")
  (setq a4b-eww-should-update t)
  (epc:call-sync epc 'scrollTo `(0 ,ypos)))

(defun a4b-web-browser-goto (url)
  (interactive "sURL: ")
  (setq a4b-eww-should-update t)
  (epc:call-sync epc 'goto `(,url)))

(defun a4b-web-browser-to-top ()
  (interactive)
  (setq a4b-eww-should-update t)
  (epc:call-sync epc 'scrollToTop '()))

(defun a4b-web-browser-click (xy)
  (setq a4b-eww-should-update t)
  (epc:call-sync epc 'click xy))

;; (defun a4b-web-browser-get-window-allocation (&optional window)
;;   (let* ((window-edges (window-inside-pixel-edges window))
;;          (x (nth 0 window-edges))
;;          (y (nth 1 window-edges))
;;          (w (- (nth 2 window-edges) x))
;;          (h (- (nth 3 window-edges) y))
;;          )
;;     (list x y w h)))

;; (defun a4b-web-browser-get-emacs-xid ()
;;   (frame-parameter nil 'window-id))

;; (random t)

;; (defun a4b-web-browser-generate-id ()
;;   (format "%04x%04x-%04x-%04x-%04x-%06x%06x"
;;           (random (expt 16 4))
;;           (random (expt 16 4))
;;           (random (expt 16 4))
;;           (random (expt 16 4))
;;           (random (expt 16 4))
;;           (random (expt 16 6))
;;           (random (expt 16 6)) ))

;; (defvar node-file (expand-file-name "browser.js" (file-name-directory load-file-name)))

;; (defvar node-browser
;;   (let* ((browser
;;           (epc:start-epc (or (getenv "PYTHON") "python")
;;                          (list pyepc-file))))
;;     (epc:call-deferred browser 'init (list (a4b-web-browser-get-emacs-xid)))
;;     browser))

;; (defvar a4b-web-browser-buffer-dict (make-hash-table :test 'equal))

;; (defvar a4b-web-browser-history-urls-path "~/.emacs.d/deepin-emacs/a4b-web-browser-history")
;; (defvar a4b-web-browser-history-urls (make-hash-table :test 'equal))

;; (defvar a4b-web-browser-title-length 30)

;; (defvar a4b-web-browser-tab-index 0)

;; (defun a4b-web-browser-create-buffer (url)
;;   (setq a4b-web-browser-tab-index (+ a4b-web-browser-tab-index 1))
;;   (let ((a4b-web-browser-buffer (generate-new-buffer (concat (truncate-string-to-width url a4b-web-browser-title-length)))))
;;     (with-current-buffer a4b-web-browser-buffer
;;       (a4b-web-browser-mode)
;;       (set (make-local-variable 'buffer-url) url)
;;       (puthash buffer-id a4b-web-browser-buffer a4b-web-browser-buffer-dict)
;;       )
;;     a4b-web-browser-buffer))

;; (defun a4b-web-browser-get-url-name (url)
;;   (car (last (split-string url "://")))
;;   )

;; (defun a4b-web-browser-get-url-history (url-name)
;;   (gethash url-name a4b-web-browser-history-urls)
;;   )

;; (defun a4b-web-browser-change-buffer-title (id title)
;;   (let* ((buffer (gethash id a4b-web-browser-buffer-dict)))
;;     (with-current-buffer buffer
;;       ;; Rename buffer title.
;;       (rename-buffer (truncate-string-to-width title a4b-web-browser-title-length))

;;       ;; Record url title in history.
;;       (let* ((url-name (a4b-web-browser-get-url-name buffer-url))
;;              (url-history (a4b-web-browser-get-url-history url-name)))
;;         (if url-history
;;             (let ((url-number (car url-history))
;;                   (url-title (cdr url-history)))
;;               (puthash url-name (list url-number title) a4b-web-browser-history-urls)
;;               (a4b-web-browser-save-history-urls))))
;;       )
;;     )
;;   )

;; (defun a4b-web-browser-delete-history-url (url-name)
;;   (let ((url-history (a4b-web-browser-get-url-history url-name)))
;;     (when url-history
;;       (remhash url-name a4b-web-browser-history-urls)
;;       (a4b-web-browser-save-history-urls))))

;; (defun a4b-web-browser-clean-history ()
;;   (setq a4b-web-browser-history-urls nil)
;;   (a4b-web-browser-save-history-urls))

;; (defun a4b-web-browser-save-history-urls ()
;;   (with-current-buffer (find-file-noselect a4b-web-browser-history-urls-path)
;;     (erase-buffer)
;;     (insert (prin1-to-string a4b-web-browser-history-urls))
;;     (save-buffer)))

;; (defun a4b-web-browser-restore-history-urls ()
;;   (if (file-exists-p a4b-web-browser-history-urls-path)
;;       (setq a4b-web-browser-history-urls
;;             (read
;;              (with-temp-buffer
;;                (insert-file-contents a4b-web-browser-history-urls-path)
;;                (buffer-string))))))

;; (a4b-web-browser-restore-history-urls)

;; (defun a4b-web-browser-open-url (url)
;;   (interactive "sURL: ")
;;   (let* ((buffer (a4b-web-browser-create-buffer url))
;;          (url-parts (split-string url "://"))
;;          )
;;     (unless (member (nth 0 url-parts) (list "http" "https" "ftp" "file"))
;;       (if (= (length url-parts) 1)
;;           (setq url (concat "http://" (nth 0 url-parts))))
;;       )
;;     (with-current-buffer buffer
;;       (let* ((window-allocation (a4b-web-browser-get-window-allocation))
;;              (x (nth 0 window-allocation))
;;              (y (nth 1 window-allocation))
;;              (w (nth 2 window-allocation))
;;              (h (nth 3 window-allocation))
;;              (view-id (a4b-web-browser-generate-id)))
;;         (epc:call-deferred pyepc-browser 'create_buffer (list buffer-id url w h))
;;         ))
;;     (switch-to-buffer buffer)

;;     ;; Record browse history.
;;     (let* ((url-name (a4b-web-browser-get-url-name url))
;;            (url-history (a4b-web-browser-get-url-history url-name)))
;;       (if url-history
;;           (let ((url-number (car url-history))
;;                 (url-title (cdr url-history)))
;;             (puthash url-name (list (+ url-number 1) url-title) a4b-web-browser-history-urls))
;;         (puthash url-name (list 1 url) a4b-web-browser-history-urls))
;;       (a4b-web-browser-save-history-urls))
;;     ))

;; (defun a4b-web-browser-monitor-window-change (&rest _)
;;   (let ((view-infos)
;;         (selected-buffer (window-buffer (selected-window))))
;;     (dolist (window (window-list))
;;       (let ((buffer (window-buffer window)))
;;         (with-current-buffer buffer
;;           (if (string= "a4b-web-browser-mode" (format "%s" major-mode))
;;               (let* ((window-allocation (a4b-web-browser-get-window-allocation window))
;;                      (x (nth 0 window-allocation))
;;                      (y (nth 1 window-allocation))
;;                      (w (nth 2 window-allocation))
;;                      (h (nth 3 window-allocation))
;;                      )
;;                 (add-to-list 'view-infos (list buffer-id x y w h))
;;                 )))))
;;     (epc:call-deferred pyepc-browser 'update_views (list view-infos))

;;     (with-current-buffer selected-buffer
;;       (if (string= "a4b-web-browser-mode" (format "%s" major-mode))
;;           (let* ((window-allocation (a4b-web-browser-get-window-allocation (selected-window)))
;;                  (w (nth 2 window-allocation))
;;                  (h (nth 3 window-allocation))
;;                  )
;;             (epc:call-deferred pyepc-browser 'adjust_size (list buffer-id w h))
;;             )))
;;     ))

;; (defun a4b-web-browser-monitor-buffer-kill ()
;;   (with-current-buffer (buffer-name)
;;     (if (string= "a4b-web-browser-mode" (format "%s" major-mode))
;;         (progn
;;           (epc:call-deferred pyepc-browser 'remove_buffer (list buffer-id))
;;           (remhash buffer-id a4b-web-browser-buffer-dict)))))

;; (defun a4b-web-browser-focus-browser-view ()
;;   (interactive)
;;   (with-current-buffer (current-buffer)
;;     (if (string= "a4b-web-browser-mode" (format "%s" major-mode))
;;         (let* ((window-allocation (a4b-web-browser-get-window-allocation (get-buffer-window (current-buffer))))
;;                (x (nth 0 window-allocation))
;;                (y (nth 1 window-allocation))
;;                (w (nth 2 window-allocation))
;;                (h (nth 3 window-allocation))
;;                )
;;           (epc:call-deferred pyepc-browser 'focus_view (list buffer-id x y w h))
;;           (message "Focus view: %S" buffer-id)
;;           )
;;       )))

;; (defadvice switch-to-buffer (after a4b-web-browser-switch-to-buffer-advice activate)
;;   (a4b-web-browser-focus-browser-view))

;; (defadvice other-window (after a4b-web-browser-other-window-advice activate)
;;   (a4b-web-browser-focus-browser-view))

;; (add-hook 'window-configuration-change-hook #'a4b-web-browser-monitor-window-change)
;; (add-hook 'kill-buffer-hook #'a4b-web-browser-monitor-buffer-kill)

;; (epc:define-method pyepc-browser
;;                    'message
;;                    (lambda (&rest args) (message "%S" args)))

;; (epc:define-method pyepc-browser
;;                    'open-url
;;                    (lambda (&rest args)
;;                      (a4b-web-browser-open-url (nth 0 args))
;;                      ))

;; (epc:define-method pyepc-browser
;;                    'change-buffer-title
;;                    (lambda (&rest args)
;;                      (a4b-web-browser-change-buffer-title (nth 0 args) (nth 1 args))
;;                      ))

;; (epc:define-method pyepc-browser
;;                    'focus-browser-view
;;                    (lambda (&rest args)
;;                      (a4b-web-browser-focus-browser-view)
;;                      ))

(provide 'a4b-web-browser)

;; ;;; a4b-web-browser.el ends here
