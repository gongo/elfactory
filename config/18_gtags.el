(lazyload (gtags-mode) "gtags")
(defun-add-hook 'gtags-mode-hook
  ;; like etags
  (local-set-key (kbd "M-.") 'gtags-find-tag)  ;; 定義元へジャンプ
  (local-set-key (kbd "M-s") 'gtags-find-rtag) ;; 定義の参照元へ
  (local-set-key (kbd "M-*") 'gtags-pop-stack) ;; ジャンプ前に戻る
  (setq gtags-path-style 'relative)
  )
