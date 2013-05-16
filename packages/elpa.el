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
            'direx
            'e2wm
            'expand-region
            'feature-mode
            'flycheck
            'git-gutter
            'golden-ratio
            'helm
            'helm-ag
            'helm-gtags
            'key-combo
            'markdown-mode
            'melpa
            'multi-web-mode
            'multiple-cursors
            'open-junk-file
            'org
            'php-mode
            'popwin
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

