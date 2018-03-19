(package! evil-collection)

(package! git-auto-commit-mode)

;; TODO should config not be in config.el
(package! drupal-mode
 :config
 (setq drupal-drush-program "c:/Bitnami/drupal-7.56-2/apps/drupal/drush/dr.bat"))

(package! pdf-tools)

;; (package! ob-browser)
(package! ob-async)
(package! firestarter)

(package! ob-clojure-literate)

(package! ob-typescript)
(package! rich-minority)
(package! lispy)
;; (package! psysh)
(package! livid-mode)
(package! list-processes+)
(package! xmlgen)
(package! indium)

;; Git requirements
(package! evil-magit)
;; (packp)

;; (package! solarized-theme)

;; (package! org-trello)

(package! emacs-snippets
  :recipe (:fetcher github
           :repo "allforabit/emacs-snippets"
           :files ("*")))

;; Would prefer this but it's not working!!!
;; (package! emacs-snippets
;;   :recipe (:fetcher file
;;            :path "~/Documents/GitHub/emacs-snippets"
;;            :files ("*")))

;; Should only be windows
(package! fakecygpty
  :recipe (:fetcher github
           :repo "d5884/fakecygpty"
           :files ("*")))
