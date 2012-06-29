(req powerline
     (setq powerline-color1 "IndianRed4")
     (setq powerline-color2 "RoyalBlue4")
     (setq powerline-color3 "grey40")


     (set-face-attribute 'mode-line nil
                         :background "firebrick"
                         :box nil)
     (set-face-attribute 'mode-line-inactive nil
                         :box nil)

     ;; 元は24ぐらいだった
     (defun powerline-make-fill
       (color)
       ;; justify right by filling with spaces to right fringe, 20 should be calculated
       (let ((plface (powerline-make-face color)))
         (if (eq 'right (get-scroll-bar-mode))
             (propertize " " 'display '((space :align-to (- right-fringe 37)))
                         'face plface)
           (propertize " " 'display '((space :align-to (- right-fringe 40)))
                       'face plface))))

     (defpowerline percent       "%3p")
     (defpowerline buffer-encode "%Z")

     (setq-default
      mode-line-format
      (list "%e"
            '(:eval (concat
                     (powerline-rmw            'left   nil  powerline-color1 )
                     (powerline-buffer-encode  'left        powerline-color1  powerline-color2  )
                     (powerline-buffer-id      'left                          powerline-color2  )
                     (powerline-narrow         'left                          powerline-color2  powerline-color3  )
                     (powerline-global         'center                                          powerline-color3  )
                     (powerline-make-fill                                                       powerline-color3  )
                     (powerline-major-mode     'right                         powerline-color2  powerline-color3 )
                     (powerline-process        'text                          powerline-color2  )
                     (powerline-minor-modes    'right                         powerline-color2  )
                     (powerline-row            'right       powerline-color1  powerline-color2  )
                     (powerline-make-text      ":"          powerline-color1  )
                     (powerline-column         'right       powerline-color1  )
                     (powerline-percent        'right       powerline-color1  )
                     (powerline-percent-xpm    'right  nil  powerline-color1  )
                     (powerline-make-text      "  "    nil  )))))
     )
