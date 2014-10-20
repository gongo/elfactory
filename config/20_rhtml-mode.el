(dolist (ext '("\\.rhtml\\'" "\\.erb\\'"))
  (add-to-list 'auto-mode-alist
               `((,ext . rhtml-mode)) t))
