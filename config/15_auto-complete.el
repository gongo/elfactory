(require 'auto-complete-config)

(setq ac-auto-show-menu 0.8)
;;(add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
(ac-config-default)

(setq ac-use-menu-map t)

(push 'ac-source-words-in-all-buffer ac-sources)
