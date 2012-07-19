(require 'helm-config)
(require 'helm-gtags)

;; customize
(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)

;; key bindings
(defun-add-hook 'helm-gtags-mode-hook
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))
