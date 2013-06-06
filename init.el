;;---------------------------------------
;; load-path for elisp files
;;---------------------------------------
(setq load-path
      (append (list (expand-file-name "~/.emacs.d/site-lisp")
		    (expand-file-name "~/.emacs.d/vendor"))
	      load-path))

(when (file-exists-p "~/.emacs.d/.secrets.el")
  (load-file "~/.emacs.d/.secrets.el"))

;;---------------------------------------
;; load-path for config files
;;---------------------------------------
(require 'init-loader)
(init-loader-load (expand-file-name "~/.emacs.d/config"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d24e10524bb50385f7631400950ba488fa45560afcadd21e6e03c2f5d0fad194" "6615e5aefae7d222a0c252c81aac52c4efb2218d35dfbb93c023c4b94d3fa0db" "1760322f987b57884e38f4076ac586c27566a1d7ed421b67843c8c98a1501e3a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(org-file-apps (quote (("pdf" . "evince %s"))))
 '(php-mode-coding-style (quote symfony2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
