;;; config.el -*- lexical-binding: t; -*-

;; Fix BG
;; https://emacs.stackexchange.com/questions/2955/how-to-customize-background-color-for-some-web-pages-opened-with-eww
(setq shr-color-visible-luminance-min 70)
(setq +lookup-open-url-fn 'eww)

(set! :popup "^\\*eww\\*$"    '((size . 80) (slot . 0) (side . left)) '((quit) (select . t) (modeline . t)))

(def-package! a4b-web-browser)
