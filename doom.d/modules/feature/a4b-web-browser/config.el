;;; config.el --- A4B web browser -*- lexical-binding: t; -*-


(setq a4b-eww-should-update nil)
;; TODO should this go in an after hook or similar
(add-hook 'eww-mode-hook
          (lambda ()
            (message "Adding revert functions")
            ;; Faster updates
            (setq-local auto-revert-interval 0.1)
            (setq-local buffer-stale-function
                        #'(lambda (&optional noconfirm) (if (eq a4b-eww-should-update t)
                                                            (progn
                                                              (setq a4b-eww-should-update nil)
                                                              t)
                                                            nil)))
            (setq-local revert-buffer-function
                        #'(lambda (&rest -) (eww-reload)))))


(evil-define-key 'normal eww-mode-map (kbd "<down-mouse-1>")
  (lambda (event)
    (interactive "e")
    (let* ((posn (elt event 1))
           (xy (posn-object-x-y posn)))
      (message "Clicked %s" xy)
      (a4b-web-browser-click xy))))

;; TODO won't work for linux
;; TODO map qutebrowser type nav, e.g. j/k (up/down)
(evil-define-key 'normal eww-mode-map (kbd "<wheel-down>")
  (lambda (event)
    (interactive "e")
    (a4b-web-browser-scroll-down)))

(evil-define-key 'normal eww-mode-map (kbd "<wheel-up>")
  (lambda (event)
    (interactive "e")
    (a4b-web-browser-scroll-up)))

(setq a4b-web-browser-load-path (expand-file-name "packages/a4b-web-browser" (file-name-directory (or load-file-name buffer-file-name))))

(def-package! a4b-web-browser
  :load-path a4b-web-browser-load-path
  :commands (a4b-web-browser-boot))
