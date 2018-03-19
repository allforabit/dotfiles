;;; private/allforabit/autoload/evil.el -*- lexical-binding: t; -*-
;;;###if (featurep! :feature evil)

;;;###autoload (autoload '+allforabit:multi-next-line "private/allforabit/autoload/evil" nil t)
(evil-define-motion +allforabit:multi-next-line (count)
  "Move down 6 lines."
  :type line
  (let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode))))
    (evil-line-move (* 6 (or count 1)))))

;;;###autoload (autoload '+allforabit:multi-previous-line "private/allforabit/autoload/evil" nil t)
(evil-define-motion +allforabit:multi-previous-line (count)
  "Move up 6 lines."
  :type line
  (let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode))))
    (evil-line-move (- (* 6 (or count 1))))))

;;;###autoload (autoload '+allforabit:cd "private/allforabit/autoload/evil" nil t)
(evil-define-command +allforabit:cd ()
  "Change `default-directory' with `cd'."
  (interactive "<f>")
  (cd input))

;;;###autoload (autoload '+allforabit:kill-all-buffers "private/allforabit/autoload/evil" nil t)
(evil-define-command +allforabit:kill-all-buffers (&optional bang)
  "Kill all buffers. If BANG, kill current session too."
  (interactive "<!>")
  (if bang
      (+workspace/kill-session)
    (doom/kill-all-buffers)))

;;;###autoload (autoload '+allforabit:kill-matching-buffers "private/allforabit/autoload/evil" nil t)
(evil-define-command +allforabit:kill-matching-buffers (&optional bang pattern)
  "Kill all buffers matching PATTERN regexp. If BANG, only match project
buffers."
  (interactive "<a>")
  (doom/kill-matching-buffers pattern bang))
