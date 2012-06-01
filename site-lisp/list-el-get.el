;;
;; el-get でインストールを行う elisp 一覧
;;

(let ((el-get-default-process-sync t))
  (el-get-install 'gtags)
  (el-get-install 'id-manager)
  (el-get-install 'anything)
  (el-get-install 'anything-rdefs)
  )
