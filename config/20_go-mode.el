(require 'auto-complete-config)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)

(eval-after-load 'go-mode
  '(progn
     (require 'go-autocomplete)
     (defun-add-hook 'go-mode-hook
       (setq c-basic-offset 4)
       (setq indent-tabs-mode t)
       (local-set-key (kbd "M-.") 'godef-jump)
       (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
       (local-set-key (kbd "C-c i") 'go-goto-imports)
       (local-set-key (kbd "C-c d") 'godoc))))
