(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))

(unless (require 'el-get nil t)
  (with-current-buffer
      (find-file-noselect "el-get/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path
             (expand-file-name "~/.emacs.d/el-get-recipes"))

(el-get 'sync)
