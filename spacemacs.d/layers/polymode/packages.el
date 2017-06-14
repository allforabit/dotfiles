(defconst polymode-packages
  '(polymode))

(defun polymode/init-polymode ()
  (use-package polymode
    :init
    (progn)))

      ;; (require 'polymode)

      ;; (defcustom pm-host/cljs
      ;;   (pm-bchunkmode "cljs" :mode 'clojurescript-mode)
      ;;   "Latex host chunkmode"
      ;;   :group 'hostmodes
      ;;   :type 'object)

      ;; (defcustom  pm-inner/glsl
      ;;   (pm-hbtchunkmode "glsl"
      ;;                    :mode 'glsl-mode
      ;;                    :head-reg  "\(.*\/defglsl[^\"]*\""
      ;;                    :tail-reg  "\"\)")
      ;;   "GLSL inner chunkmode"
      ;;   :group 'innermodes
      ;;   :type 'object)

      ;; (defcustom pm-poly/glsl
      ;;   (pm-polymode-one "glsl"
      ;;                    :hostmode 'pm-host/gljs
      ;;                    :innermode 'pm-inner/glsl)
      ;;   "GLSL polymode."
      ;;   :group 'polymodes
      ;;   :type 'object)

      ;;(define-polymode poly-cljs-glsl-mode pm-poly/glsl))))
      

;;; packages.el ends here
