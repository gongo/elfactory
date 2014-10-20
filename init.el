;;---------------------------------------
;; load-path for elisp files
;;---------------------------------------
;; emacs -l init.el等で直接ロードしたときに, user-emacs-directoryが書き換わる
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(dolist (dir '("site-lisp" "vendor"))
  (add-to-list 'load-path (concat user-emacs-directory dir)))

(let ((secret (concat user-emacs-directory ".secrets.el")))
  (when (file-exists-p secret)
    (load-file secret)))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;---------------------------------------
;; load-path for config files
;;---------------------------------------
(require 'init-loader)
(init-loader-load (concat user-emacs-directory "config"))
