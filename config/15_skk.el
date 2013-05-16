(require 'skk-autoloads)

(setq skk-server-portnum 1178)
(setq skk-server-host "localhost")
(setq skk-show-inline 'vertical)
(global-set-key (kbd "C-x j") 'skk-mode)

(make-face 'modeline)
(skk-mode)
(add-hook 'find-file-hook 'skk-latin-mode-on)
