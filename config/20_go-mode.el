(require 'go-mode-load)
(require 'go-autocomplete)

(defun-add-hook 'go-mode-hook
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c d") 'godoc))
