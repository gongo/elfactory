(require 'rbenv)

(dolist (ext '("\\.rake\\'" "Rakefile\\'" "Gemfile\\'" "Guardfile\\'" "\\.gemspec\\'"))
  (append-to-list auto-mode-alist
                  `((,ext . ruby-mode))))

(lazyload (ruby-mode) "ruby-mode"
          (setq ruby-deep-indent-paren nil))

(global-rbenv-mode)

(defun-add-hook 'ruby-mode-hook
  (req auto-complete-config
       (make-variable-buffer-local 'ac-sources)
       (setq ac-sources '(ac-source-filename
                          ac-source-words-in-buffer
                          ))))
