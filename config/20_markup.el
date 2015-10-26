;;
;; emmet
;;--------------------
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

(eval-after-load 'emmet-mode
  '(progn
     (defun-add-hook 'emmet-mode-hook
       (setq emmet-indentation 2))
     (define-key emmet-mode-keymap (kbd "C-j") nil)
     (define-key emmet-mode-keymap (kbd "C-<tab>") 'emmet-expand-line)))

;;
;; web-mode
;;--------------------
(add-to-list 'auto-mode-alist '("\\.tpl\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.ihtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(eval-after-load 'web-mode
  '(defun-add-hook 'web-mode-hook
     (setq web-mode-markup-indent-offset 4)
     (setq web-mode-css-indent-offset    4)
     (setq web-mode-code-indent-offset   4)
     (setq indent-tabs-mode nil)
     (setq tab-width 4)))

;;
;; terraform-mode
;;--------------------
(setq terraform-indent-level 4)

;;
;; markdown-mode
;;--------------------
(add-hook 'markdown-mode-hook 'orgtbl-mode)
