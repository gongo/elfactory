(require 'key-combo)
(key-combo-mode)

(key-combo-define-global (kbd "=") '("=" " = " " == "))

;; (add-hook 'sh-mode-hook
;;   ;; (key-combo-define-local (kbd "=") '(nil nil nil))
;;   'my-smartchr-keybindings)
