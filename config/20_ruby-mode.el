(require 'rbenv)

(dolist (ext '("\\.rake\\'" "Rakefile\\'" "Gemfile\\'" "Guardfile\\'" "\\.gemspec\\'"))
  (add-to-list 'auto-mode-alist
               `((,ext . ruby-mode))
               t))

(lazyload (ruby-mode) "ruby-mode"
          (setq ruby-deep-indent-paren nil))

(global-rbenv-mode)

(defun-add-hook 'ruby-mode-hook
  (setq ruby-insert-encoding-magic-comment nil)
  (req auto-complete-config
       (make-variable-buffer-local 'ac-sources)
       (setq ac-sources '(ac-source-filename
                          ac-source-words-in-buffer
                          ))))
