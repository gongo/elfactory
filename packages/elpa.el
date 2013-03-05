;;
;; package-install でインストールを行う elisp 一覧
;;

(package-refresh-contents)

(dolist (p (list
            ;; install elisps --
            'ace-jump-mode
            'all-ext
            'auto-complete
            'cacoo
            'concurrent
            'deferred
            'dired+
            'e2wm
            'feature-mode
            'flycheck
            'git-gutter
            'helm
            'helm-gtags
            'key-combo
            'markdown-mode
            'melpa
            'monokai-theme
            'multi-web-mode
            'open-junk-file
            'org
            'php-mode
            'quickrun
            'request
            'smartrep
            'sr-speedbar
            'textile-mode
            'websocket
            'yaml-mode
            ;; -----------------
            ))
  (unless (package-installed-p p) (package-install p)))

