(require 'coffee-mode)

(custom-set-variables '(coffee-tab-width 2))
(defun-add-hook 'coffee-mode-hook
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-tab-indent 2))
