(defconst lispy-packages
  '(lispy
    (evil-lispy :location (recipe :fetcher github
                                  :repo "allforabit/evil-lispy"
                                  :branch "master"))))

(defun lispy/init-lispy ()
  (use-package lispy
    :defer t
    :config (spacemacs|diminish lispy-mode "" "")))

(defun lispy/init-evil-lispy ()
  (use-package evil-lispy
    :defer t
    :init (progn (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
                 (evil-lispy-layer-configure-colorization))
    :commands (evil-lispy-mode)
    :config (progn
              (spacemacs|diminish evil-lispy-mode " Ⓛ" " L")

              (when (configuration-layer/package-usedp 'cider)

                ;; todo better mechanism of loading cider
                (require 'cider)
                ;; show eval results in a cider overlay, next to point
                (add-to-list 'lispy-compat 'cider)
                (setq lispy-eval-display-style 'overlay)))))

;; todo backspace on {} characters is broken
;; todo yanking marked stuff is broken
;; todo a hydra/map to show lispy keys?

(defun evil-lispy-layer-configure-colorization ()
  ;; this will be displayed in the modeline
  (let ((mode-color "light sea green"))

    (defface spacemacs-lispy-face
      `((t :inherit 'mode-line
           :background ,mode-color))
      "lispy state face."
      :group 'spacemacs)

    (setq evil-lispy-state-cursor '(mode-color box))

    (setq evil-lispy-state-cursor
          (list (when dotspacemacs-colorize-cursor-according-to-state mode-color)
                'box))))
