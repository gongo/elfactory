(eval-after-load 'php-mode
  '(progn
     (setq phpcmp-global-enable-auto-update-tag-files t)))

(add-to-list 'auto-mode-alist
             '(("\\.php\\'" . php-mode)
               ("\\.php3\\'" . php-mode)
               ("\\.inc\\'" . php-mode))
             t)

(speedbar-add-supported-extension '("php" "inc" "php3"))

;;----------------------------------------
;; Configuration
;;----------------------------------------
(add-to-list 'ac-modes 'php-mode)

(defun-add-hook 'php-mode-hook
  (define-abbrev php-mode-abbrev-table "ex" "extends")
  ;;(c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label' 4)
  (c-set-offset 'arglist-intro' 4)
  (c-set-offset 'arglist-cont-nonempty' 4)
  (c-set-offset 'arglist-close' 0)
  (setq-default tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (setq imenu-generic-expression php-imenu-generic-expression)
  (helm-gtags-mode 1)
  (req auto-complete-config
       (make-variable-buffer-local 'ac-sources)
       (setq ac-sources '(ac-source-words-in-all-buffer
                          ac-source-filename
                          ))))
