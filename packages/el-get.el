;;
;; el-get でインストールを行う elisp 一覧
;;

(let ((el-get-default-process-sync t))
  (dolist (p (list
              'id-manager
              ))
    (el-get-install p)))
