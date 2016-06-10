(defconst lisp-custom-packages
  '((helm-cider :location (recipe :fetcher github
                                  :repo "clojure-emacs/helm-cider"
                                  :branch "master"))
    (clojure-semantic :location (recipe :fetcher github
                                        :repo "kototama/clojure-semantic"
                                        :branch "master"))))

(evil-define-key 'normal evil-lispy-mode-map
  "[e" #'lispy-move-up
  "]e" #'lispy-move-down)

(defun lisp-custom/init-clojure-semantic ()
  (use-package clojure-semantic
    :defer t
    :init (progn
            (with-eval-after-load 'clojure-mode
              (load "~/.emacs.d/elpa/clojure-semantic-20130322.1502/clojure.el"))

            (with-eval-after-load 'clojurescript-mode
              (load "~/.emacs.d/elpa/clojure-semantic-20130322.1502/clojure.el")
              (add-to-list 'semantic-new-buffer-setup-functions
                           (cons 'clojurescript-mode 'wisent-clojure-default-setup)))

            (add-hook 'clojure-mode-hook #'evil-lispy-mode)
            (add-hook 'clojurescript-mode-hook #'evil-lispy-mode))
    :config (spacemacs|diminish lisp-custom-mode "" "")))

(defun lisp-custom/init-helm-cider ()
  (use-package helm-cider
    :defer t))
