;;;###autoload
(defun get-link ()
    (replace-regexp-in-string "\\[\\[\\(.*\\)\\]\\]" "\\1"
                              (buffer-substring (line-beginning-position) (line-end-position))))

;;;###autoload
(defun set-img-size ()
  "Insert latex and html header for image size."
  (interactive)
  (cond
   ((equal current-prefix-arg nil)
    (setq n 500))
   (t
    (setq n (read-number "Image width in px: "))))
  (insert (format "#+attr_latex: :width %spx\n" n))
  (insert (format "#+attr_html:  :width %spx\n" n)))

;;;###autoload
(defun draw-image ()
  (interactive)
  (setq file-path (get-link))
  (setq output-link
    (shell-command-to-string
     (concat "draw-image " (file-name-base file-path))))
  (delete-region (line-beginning-position) (line-end-position))
  (set-img-size)
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
