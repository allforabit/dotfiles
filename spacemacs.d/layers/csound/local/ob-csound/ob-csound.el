;;; ob-csound.el --- org-babel functions for csound evaluation

;; Copyright (C) your name here

;; Author: your name here
;; Keywords: literate programming, reproducible research
;; Homepage: http://orgmode.org
;; Version: 0.01

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; This file is not intended to ever be loaded by org-babel, rather it
;; is a csound for use in adding new language support to Org-babel.
;; Good first steps are to copy this file to a file named by the
;; language you are adding, and then use `query-replace' to replace
;; all strings of "csound" in this file with the name of your new
;; language.
;;
;; If you have questions as to any of the portions of the file defined
;; below please look to existing language support for guidance.
;;
;; If you are planning on adding a language to org-babel we would ask
;; that if possible you fill out the FSF copyright assignment form
;; available at http://orgmode.org/request-assign-future.txt as this
;; will make it possible to include your language support in the core
;; of Org-mode, otherwise unassigned language support files can still
;; be included in the contrib/ directory of the Org-mode repository.

;;; Requirements:

;; Use this section to list the requirements of this language.  Most
;; languages will require that at least the language be installed on
;; the user's system, and the Emacs major mode relevant to the
;; language be installed as well.

;;; Code:
(require 'ob)
(require 'ob-ref)
(require 'ob-comint)
(require 'ob-eval)
;; possibly require modes required for your language

;; optionally define a file extension for this language
(add-to-list 'org-babel-tangle-lang-exts '("csound" . "csd"))
(add-to-list 'org-babel-tangle-lang-exts '("csound" . "orc"))
(add-to-list 'org-babel-tangle-lang-exts '("csound" . "sco"))

;; optionally declare default header arguments for this language
(defvar org-babel-default-header-args:csound '())

;; This function expands the body of a source code block by doing
;; things like prepending argument definitions to the body, it should
;; be called by the `org-babel-execute:csound' function below.
(defun org-babel-expand-body:csound (body params &optional processed-params)
  "Expand BODY according to PARAMS, return the expanded body."
  ;; (require 'inf-csound)
  ;; (let ((vars (nth 1 (or processed-params (org-babel-process-params params)))))
  ;;   (concat
  ;;    (mapconcat ;; define any variables
  ;;     (lambda (pair)
  ;;       (format "%s=%S"
  ;;               (car pair) (org-babel-csound-var-to-csound (cdr pair))))
  ;;     vars "\n") "\n" body "\n"))
  (message "Expand body csound")
  "Hello from csound")

;; This is the main function which is called to evaluate a code
;; block.
;;
;; This function will evaluate the body of the source code and
;; return the results as emacs-lisp depending on the value of the
;; :results header argument
;; - output means that the output to STDOUT will be captured and
;;   returned
;; - value means that the value of the last statement in the
;;   source code block will be returned
;;
;; The most common first step in this function is the expansion of the
;; PARAMS argument using `org-babel-process-params'.
;;
;; Please feel free to not implement options which aren't appropriate
;; for your language (e.g. not all languages support interactive
;; "session" evaluation).  Also you are free to define any new header
;; arguments which you feel may be useful -- all header arguments
;; specified by the user will be available in the PARAMS variable.
(defun org-babel-execute:csound (body params)
  "Execute a block of Csound code with org-babel.
This function is called by `org-babel-execute-src-block'"

  (let* ((processed-params (org-babel-variable-assignments:csound params))
         ;; set the session if the session variable is non-nil
         ;; (session (org-babel-csound-initiate-session (first processed-params)))
         ;; variables assigned for use in the block
         (vars (second processed-params))
         (result-params (third processed-params))
         ;; either OUTPUT or VALUE which should behave as described above
         (result-type (fourth processed-params))
         ;; expand the body with `org-babel-expand-body:csound'
         (full-body (org-babel-expand-body:csound
                     body params processed-params)))

    ;; (with-temp-file in-file
    ;;   (insert (org-babel-expand-body:generic body params)))

    ;; actually execute the source-code block either in a session or
    ;; possibly by dropping it to a temporary file and evaluating the
    ;; file.
    ;; 
    ;; for session based evaluation the functions defined in
    ;; `org-babel-comint' will probably be helpful.
    ;;
    ;; for external evaluation the functions defined in
    ;; `org-babel-eval' will probably be helpful.
    ;;
    ;; when forming a shell command, or a fragment of code in some
    ;; other language, please preprocess any file names involved with
    ;; the function `org-babel-process-file-name'. (See the way that
    ;; function is used in the language files)

    (if
        (equal (alist-get :type params) "sco")
        (csoundReadScore csound body)
      (csoundCompileOrc csound body)
      )

    )
  "Csound process hello")

;; This function should be used to assign any variables in params in
;; the context of the session environment.
(defun org-babel-prep-session:csound (session params)
  "Prepare SESSION according to the header arguments specified in PARAMS.")

(defun org-babel-variable-assignments:csound (params)
  "Return a list of Python statements assigning the block's variables."

  (setq kn-assign
        (mapcar
         (lambda (pair)
           (format "%s"
                   ;; (car pair)
                   (org-babel-csound-var-to-csound (cdr pair))))
         (org-babel--get-vars params)))

  params)


(defun org-babel-csound-var-to-csound (var)
  "Convert an elisp value to a python variable.
Convert an elisp value, VAR, into a string of python source code
specifying a variable of the same value."
  (if (listp var)
      (if (equal (type-of (car var)) 'cons)
          ;; No i at start for list of lists
          (concat (mapconcat #'org-babel-csound-var-to-csound var " ") "\n")
        (concat "i " (mapconcat #'org-babel-csound-var-to-csound var " ") "\n"))
    ;;
    (format
     (if (and (stringp var) (string-match "[\n\r]" var)) "\"\"%S\"\"" "%S")
     (if (stringp var) (substring-no-properties var) var))))

(defun org-babel-csound-table-or-string (results)
  "If the results look like a table, then convert them into an
Emacs-lisp table, otherwise return the results as a string."
  )

(defun org-babel-csound-initiate-session (&optional session)
  "If there is not a current inferior-process-buffer in SESSION then create.
Return the initialized session."
  (unless (string= session "none")
    ))

(provide 'ob-csound)
;;; ob-csound.el ends here
