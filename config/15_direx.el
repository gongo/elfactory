;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
(require 'direx)

(req popwin
     (push '(direx:direx-mode :position left :width 25 :dedicated t)
           popwin:special-display-config))

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
