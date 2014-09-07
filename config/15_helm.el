(require 'helm-config)
(require 'helm-gtags)
(require 'helm-files)
(require 'helm-ghq)

(defun helm-my-default()
  (interactive)
  (helm-other-buffer '(helm-source-buffers-list
                       helm-source-recentf
                       helm-source-ghq
                       )
                     "*helm default*"))

(define-key global-map (kbd "C-x b") 'helm-my-default)

;;------------------------------
;; helm-gtags
;;------------------------------

;; customize
(setq helm-gtags-path-style 'relative)
(setq helm-gtags-ignore-case t)

;; key bindings
(defun-add-hook 'helm-gtags-mode-hook
  (local-set-key (kbd "M-.") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-*") 'helm-gtags-pop-stack))

;; List files in git repos
(defun helm-c-sources-git-project-for (pwd)
  `((name . ,(format "All controlled files in this project (%s)" pwd))
    (init . (lambda ()
              (with-current-buffer (helm-candidate-buffer 'global)
                (call-process-shell-command "git ls-files" nil t nil))))
    (candidates-in-buffer)
    (candidate-transformer helm-w32-pathname-transformer)
    (type . file)))

(defun helm-git-project-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

(defun helm-git-project ()
  (interactive)
  (let ((topdir (helm-git-project-topdir)))
    (unless (file-directory-p topdir)
      (error "I'm not in Git Repository!!"))
    (let* ((default-directory topdir)
           (sources (helm-c-sources-git-project-for default-directory)))
      (helm-other-buffer sources
                         (format "*helm git project in %s*" default-directory)))))

;; (global-set-key (kbd "C-;") 'helm-git-project)

(setq helm-ff-transformer-show-only-basename nil)
