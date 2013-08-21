;;
;; el-get でインストールを行う elisp 一覧
;;

(let ((el-get-default-process-sync t))
  (dolist (p (list
              ;; install elisps --
              'id-manager
              'color-theme-tomorrow
              'open-junk-file
              'emacs-rotate
              'rcodetools
              ;; -----------------
              ))
    (el-get-install p)))
