(require 'flycheck)

;; see. http://fukuyama.co/tramp-flycheck
;; check tramp or root file
(defun flycheck-exclude-tramp ()
  (unless (or (and (fboundp 'tramp-tramp-file-p)
                   (tramp-tramp-file-p buffer-file-name))
              (string-match "sudo:.*:" (buffer-file-name)))
    (flycheck-mode t)
  ))

(dolist (hook '(python-mode-hook
                ruby-mode-hook
                php-mode-hook))
  (add-hook hook 'flycheck-exclude-tramp))

(defun-add-hook 'php-mode-hook
  (setq flycheck-phpcs-standard "PSR2"))

