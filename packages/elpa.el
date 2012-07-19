;;
;; package-install でインストールを行う elisp 一覧
;;

(package-refresh-contents)

(dolist (p (list
            ;; install elisps --
            'auto-complete
            'color-theme-sanityinc-tomorrow
            'deferred
            'e2wm
            'helm
            'helm-gtags
            'markdown-mode
            'melpa
            'multi-web-mode
            'org
            'ruby-mode
            'window-layout
            'yaml-mode
            ;; -----------------
            ))
  (unless (package-installed-p p) (package-install p)))

