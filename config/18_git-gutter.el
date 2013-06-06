;; (global-git-gutter-mode nil)

;; (require 'notifications)
;; (defun my/after-revert-hook ()
;;   (notifications-notify :title (format "Revert %s" (buffer-file-name))
;;                         :body "Check it out" :urgency 'critical))

(add-hook 'after-revert-hook 'my/after-revert-hook)
