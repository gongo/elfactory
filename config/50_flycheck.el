;; see. http://fukuyama.co/tramp-flycheck
;; check tramp or root file
(defun flycheck-exclude-tramp ()
  (unless (or (and (fboundp 'tramp-tramp-file-p)
                   (tramp-tramp-file-p buffer-file-name))
              (string-match "sudo:.*:" (buffer-file-name)))
    (flycheck-mode 1)
  ))

(dolist (hook '(python-mode-hook
                go-mode-hook
                ruby-mode-hook
                php-mode-hook
                go-mode-hook
                puppet-mode-hook))
  (add-hook hook 'flycheck-exclude-tramp))

(defun-add-hook 'php-mode-hook
  (setq flycheck-phpcs-standard "PSR2")
  (setq flycheck-phpmd-rulesets '("codesize" "controversial" "design" "naming" "unusedcode")))

