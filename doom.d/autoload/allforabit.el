;;; private/allforabit/autoload/allforabit.el -*- lexical-binding: t; -*-
;;;###autoload

(defun +allforabit/install-snippets ()
  "Install my snippets from https://github.com/allforabit/emacs-snippets into
private/allforabit/snippets."
  (interactive)
  (doom-fetch :github "hlissner/emacs-snippets"
              (expand-file-name "snippets" (doom-module-path :private 'allforabit))))

;;;###autoload
(defun +allforabit/yank-buffer-filename ()
  "Copy the current buffer's path to the kill ring."
  (interactive)
  (if-let (filename (or buffer-file-name (bound-and-true-p list-buffers-directory)))
      (message (kill-new (abbreviate-file-name filename)))
    (error "Couldn't find filename in current buffer")))

(defmacro +allforabit-def-finder! (name dir)
  "Define a pair of find-file and browse functions."
  `(progn
     (defun ,(intern (format "+allforabit/find-in-%s" name)) ()
       (interactive)
       (let ((default-directory ,dir)
             projectile-require-project-root
             projectile-cached-buffer-file-name
             projectile-cached-project-root)
         (call-interactively (command-remapping #'projectile-find-file))))
     (defun ,(intern (format "+allforabit/browse-%s" name)) ()
       (interactive)
       (let ((default-directory ,dir))
         (call-interactively (command-remapping #'find-file))))))

;;;###autoload (autoload '+allforabit/find-in-templates "private/allforabit/autoload/allforabit" nil t)
;;;###autoload (autoload '+allforabit/browse-templates "private/allforabit/autoload/allforabit" nil t)
(+allforabit-def-finder! templates +file-templates-dir)

;;;###autoload (autoload '+allforabit/find-in-snippets "private/allforabit/autoload/allforabit" nil t)
;;;###autoload (autoload '+allforabit/browse-snippets "private/allforabit/autoload/allforabit" nil t)
(+allforabit-def-finder! snippets +allforabit-snippets-dir)

;;;###autoload (autoload '+allforabit/find-in-dotfiles "private/allforabit/autoload/allforabit" nil t)
;;;###autoload (autoload '+allforabit/browse-dotfiles "private/allforabit/autoload/allforabit" nil t)
(+allforabit-def-finder! dotfiles (expand-file-name ".dotfiles" "~"))

;;;###autoload (autoload '+allforabit/find-in-emacsd "private/allforabit/autoload/allforabit" nil t)
;;;###autoload (autoload '+allforabit/browse-emacsd "private/allforabit/autoload/allforabit" nil t)
(+allforabit-def-finder! emacsd doom-emacs-dir)

;;;###autoload (autoload '+allforabit/find-in-notes "private/allforabit/autoload/allforabit" nil t)
;;;###autoload (autoload '+allforabit/browse-notes "private/allforabit/autoload/allforabit" nil t)
(+allforabit-def-finder! notes +org-dir)
