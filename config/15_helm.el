(require 'helm-config)
(require 'helm-gtags)
(require 'helm-files)
(require 'helm-ghq)

(setq helm-for-files-preferred-list '(helm-source-buffers-list helm-source-recentf helm-source-file-cache helm-source-files-in-current-dir))
(global-set-key (kbd "C-x b") 'helm-for-files)

;;------------------------------
;; helm-gtags
;;------------------------------

;; customize
(setq helm-gtags-path-style 'relative)
(setq helm-gtags-ignore-case t)

;; key bindings
(defun-add-hook 'helm-gtags-mode-hook
  (local-set-key (kbd "M-.") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-*") 'helm-gtags-pop-stack))

(setq helm-ff-transformer-show-only-basename nil)
