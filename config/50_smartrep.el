(require 'smartrep)

;; for OrgMode
(smartrep-define-key
    org-mode-map "C-c" '(("C-n" . (outline-next-visible-heading 1))
                         ("C-p" . (outline-previous-visible-heading 1))))
