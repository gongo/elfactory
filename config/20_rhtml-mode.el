(dolist (ext '("\\.rhtml\\'" "\\.erb\\'"))
  (append-to-list auto-mode-alist
                  `((,ext . rhtml-mode))))
