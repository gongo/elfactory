(require 'anything-config)

;;------------------------------------------------
;; アルファベット1文字で選択可能に
;;------------------------------------------------
;;(setq anything-enable-shortcuts 'alphabet)
(setq anything-enable-shortcuts nil)

(req anything-gtags)

(defun anything-my-default()
  (interactive)
  (anything-other-buffer '(anything-c-source-buffers+
                           anything-c-source-recentf
                           )
                         "*anything default*"))

(define-key global-map (kbd "C-x b") 'anything-my-default)
