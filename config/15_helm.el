(require 'helm-config)
(require 'helm-gtags)
(require 'helm-files)

(defun helm-my-default()
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-recentf
                       ;;helm-c-source-gtags-select
                       )
                     "*helm default*"))

(define-key global-map (kbd "C-x b") 'helm-my-default)

;;------------------------------
;; helm-gtags
;;------------------------------

;; customize
(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)

;; key bindings
(defun-add-hook 'helm-gtags-mode-hook
  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack))

;; List files in git repos
(defun helm-c-sources-git-project-for (pwd)
  (loop for elt in
        '(("Modified files" . "--modified")
          ("Untracked files" . "--others --exclude-standard")
          ("All controlled files in this project" . nil))
        for title  = (format "%s (%s)" (car elt) pwd)
        for option = (cdr elt)
        for cmd    = (format "git ls-files %s" (or option ""))
        collect
        `((name . ,title)
          (init . (lambda ()
                    (unless (and ,option (helm-candidate-buffer))
                      (with-current-buffer (helm-candidate-buffer 'global)
                        (call-process-shell-command ,cmd nil t nil)))))
          (candidates-in-buffer)
          (type . file))))

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

(define-key global-map (kbd "C-;") 'helm-git-project)
