(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))

(unless (require 'el-get nil t)
  (let ((el-get-git-install-url "https://github.com/HKey/el-get.git"))
    (with-current-buffer
	(find-file-noselect "~/.emacs.d/vendor/el-get-install.el")
      (let (el-get-master-branch
	    (el-get-emacswiki-elisp-file-list-url
	     "https://raw.github.com/gongo/elfactory/master/vendor/el-get-emacswiki-retrieve-package-list.txt"))
	(goto-char (point-max))
	(eval-print-last-sexp)))))

(add-to-list 'el-get-recipe-path
             (expand-file-name "~/.emacs.d/el-get-recipes"))

(setq el-get-use-wget t)
(el-get 'sync)
