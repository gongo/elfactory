(lazyload (php-mode) "php-mode"
          (setq phpcmp-global-enable-auto-update-tag-files t))

(append-to-list auto-mode-alist
                '(("\\.php\\'" . php-mode)
                  ("\\.php3\\'" . php-mode)
                  ("\\.inc\\'" . php-mode)))

(speedbar-add-supported-extension '("php" "inc" "php3"))

;;----------------------------------------
;; http://d.hatena.ne.jp/kitokitoki/20090901/p1
;;   php-completion.el にマニュアルをチラ見する persistent-action を追加 - わからん
;;----------------------------------------
(setq phpcmp-persistent-document-buffer "*phpcmp persistent doc*")

(defun phpcmp-popup-document-persistent-action (candidate)
  (interactive)
  (let ((docstring (phpcmp-get-document-string candidate))
        (b (get-buffer-create phpcmp-persistent-document-buffer)))
    (with-current-buffer b
      (erase-buffer)
      (insert docstring)
      (goto-char (point-min)))
    (pop-to-buffer b)))

(defun my-phpcmp-make-completion-sources ()
  (labels ((make-source
            (&key name candidates)
            `((name . ,name)
              (init . (lambda ()
                        (with-current-buffer (anything-candidate-buffer 'global)
                          (insert (mapconcat 'identity
                                             (if (functionp ',candidates)
                                                 (funcall ',candidates)
                                               ',candidates)
                                             "\n")))))
              (candidates-in-buffer)
              (action . (("Insert" . (lambda (candidate)
                                       (delete-backward-char (length phpcmp-initial-input))
                                       (insert candidate)))
                         ("Search". (lambda (candidate)
                                      (phpcmp-search-manual candidate)))))
              (persistent-action . phpcmp-popup-document-persistent-action))))
    (loop for (name candidates) in (phpcmp-completions-table)
          collect (make-source
                   :name name
                   :candidates candidates))))

(defun my-phpcmp-complete ()
  (interactive)
  (anything (my-phpcmp-make-completion-sources)
            (phpcmp-get-initial-input)))


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
  (req php-completion
    (php-completion-mode t)
    (define-key php-mode-map (kbd "C-o") 'my-phpcmp-complete))
  (req auto-complete-config
       (make-variable-buffer-local 'ac-sources)
       (setq ac-sources '(ac-source-words-in-all-buffer
                          ac-source-filename
                          ac-source-gtags
                          ))))
