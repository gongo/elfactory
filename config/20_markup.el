;;
;; emmet
;;--------------------
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(defun-add-hook 'emmet-mode-hook
  (setq emmet-indentation 2))

(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))

(define-key emmet-mode-keymap (kbd "C-<tab>") 'emmet-expand-line)

;;
;; web-mode
;;--------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.ihtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun-add-hook 'web-mode-hook
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
