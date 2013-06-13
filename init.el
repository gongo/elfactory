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
