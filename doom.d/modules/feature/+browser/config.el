;;; config.el -*- lexical-binding: t; -*-

;; Fix BG
;; https://emacs.stackexchange.com/questions/2955/how-to-customize-background-color-for-some-web-pages-opened-with-eww
(setq shr-color-visible-luminance-min 70)
(setq +lookup-open-url-fn 'eww)

(set! :popup "^\\*eww\\*$" '((size . 80) (slot . 0) (side . left)) '((quit) (select . t) (modeline . t)))

(after! eww-mode
  (evil-define-key 'normal eww-mode-map (kbd "SPC") nil))

;; Auto-rename new eww buffers
(defun xah-rename-eww-hook ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
(add-hook 'eww-mode-hook #'xah-rename-eww-hook)
