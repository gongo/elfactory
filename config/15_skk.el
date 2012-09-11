(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/skk/elisp"))
(require 'skk-autoloads)

(setq skk-server-portnum 1178)
(setq skk-server-host "localhost")
(setq skk-show-inline 'vertical)
(global-set-key (kbd "C-x j") 'skk-mode)

