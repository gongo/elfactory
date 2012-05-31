(lazyload (ruby-mode) "ruby-mode"
          (req anything-rdefs)
          (setq ruby-deep-indent-paren nil))

(append-to-list auto-mode-alist
                '(("\\.rake\\'" . ruby-mode)
                  ("Rakefile\\'" . ruby-mode)
                  ("Gemfile\\'" . ruby-mode)
                  ("\\.gemspec\\'" . ruby-mode)))
