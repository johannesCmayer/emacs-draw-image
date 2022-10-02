(defconst draw-image-packages
  '(
    (draw-image :location local)
   )
)

(defun draw-image/init-draw-image ()
  (load-file "~/.emacs.d/private/local/draw-image/draw-image.el")
  (progn
    (spacemacs/declare-prefix "aoi" "draw-image")
    (spacemacs/set-leader-keys
      "aoii" 'draw-image
      "aoid" 'draw-image-delete)))
