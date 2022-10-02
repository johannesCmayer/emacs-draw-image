;;;###autoload
(defun get-link ()
    (replace-regexp-in-string "\\[\\[\\(.*\\)\\]\\]" "\\1"
                              (buffer-substring (line-beginning-position) (line-end-position))))

;;;###autoload
(defun draw-image ()
  (interactive)
  (setq file-path (get-link))
  (setq output-link
    (shell-command-to-string
     (concat "draw-image " (file-name-base file-path))))
  (kill-whole-line)
  (insert output-link)
  (org-display-inline-images)
  (org-redisplay-inline-images))

;;;###autoload
(defun draw-image-delete ()
  (interactive)
  (setq file-path (get-link))
  (shell-command (concat "draw-image " (file-name-base file-path) " delete"))
  (kill-whole-line))

(provide 'draw-image)
(provide 'draw-image-delete)
