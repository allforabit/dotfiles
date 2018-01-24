(defconst org-babel-clojure-packages
  '(
    (ob-clojure :location local)
    ))


(defun org-babel-clojure/init-ob-clojure ()
  "Initialize stef elisp (csound package)"

  (use-package ob-clojure
    :init (message "Starting ob-clojure")))
