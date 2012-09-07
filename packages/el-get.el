;;
;; el-get でインストールを行う elisp 一覧
;;

(let ((el-get-default-process-sync t))
  (dolist (p (list
              ;; install elisps --
              'id-manager
              'php-completion
              'open-junk-file
              ;; -----------------
              ))
    (el-get-install p)))
