(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(defun-add-hook 'emmet-mode-hook
  (setq emmet-indentation 2))

(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))

(define-key emmet-mode-keymap (kbd "C-<tab>") 'emmet-expand-line)
