;;---------------------------------------
;; load-path for elisp files
;;---------------------------------------
;; emacs -l init.el等で直接ロードしたときに, user-emacs-directoryが書き換わる

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(dolist (dir '("site-lisp"))
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
