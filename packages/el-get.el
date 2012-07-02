;;
;; el-get でインストールを行う elisp 一覧
;;

(let ((el-get-default-process-sync t))
  (dolist (p (list
              ;; install elisps --
              'anything
              'anything-rdefs
              'gtags
              'id-manager
              'php-completion
              'php-mode-improved
              'cucumber.el
              ;; -----------------
              ))
    (el-get-install p)))
