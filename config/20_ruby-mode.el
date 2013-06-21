(require 'rbenv)
(require 'rcodetools)
(require 'anything-rcodetools)

(lazyload
 (ruby-mode) "ruby-mode"

 (setq ruby-deep-indent-paren nil)
 (req anything-rdefs)
 (req ruby-electric
      (ruby-electric-mode t)
      ;; Set nil if you don't want surround delimiters ("", '', (), [], etc..)
      ;; (setq ruby-electric-expand-delimiters-list nil)
      (setq ruby-electric-expand-delimiters-list '(all)))
 (req ruby-block
      (ruby-block-mode t)
      (setq ruby-block-highlight-toggle 'overlay)))

(dolist (ext '("\\.rake\\'" "Rakefile\\'" "Gemfile\\'" "Guardfile\\'" "\\.gemspec\\'"))
  (append-to-list auto-mode-alist
                  `((,ext . ruby-mode))))

(global-rbenv-mode)

(defun-add-hook 'ruby-mode-hook
  (req auto-complete-config
       (make-variable-buffer-local 'ac-sources)
       (setq ac-sources '(ac-source-filename
                          ac-source-rcodetools
                          ))))
