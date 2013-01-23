(require 'smartrep)

;; for OrgMode
(defun-add-hook 'org-mode-hook
  (smartrep-define-key
      org-mode-map "C-c" '(("C-n" . (outline-next-visible-heading 1))
                           ("C-p" . (outline-previous-visible-heading 1))
                           ("C-f" . (org-forward-same-level nil))
                           ("C-b" . (org-backward-same-level nil)))))
