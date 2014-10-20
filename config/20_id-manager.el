(autoload 'id-manager "id-manager" nil t)
(eval-after-load "id-manager"
  '(progn
     (setq idm-database-file (expand-file-name "~/Dropbox/.idm-db.gpg"))
     (setenv "GPG_AGENT_INFO" nil)
     (setq toggle-debug-on-error t)))
