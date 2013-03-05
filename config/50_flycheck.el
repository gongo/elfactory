(dolist (hook '(python-mode-hook
               ruby-mode-hook
               php-mode-hook
               sh-mode-hook))
  (add-hook hook 'flycheck-mode))
