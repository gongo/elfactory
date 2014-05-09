;; http://d.hatena.ne.jp/l1o0/20100429/1272557315

(unless window-system
  (if (executable-find "xsel")
      (progn
        (defun my-cut-function (text &optional rest)
          (let ((process-connection-type nil))
            (let ((proc (start-process "xsel" "*Messages*" "xsel" "--clipboard" "--input")))
              (process-send-string proc text)
              (process-send-eof proc))))

        (defun my-paste-function ()
          (shell-command-to-string "xsel --clipboard --output"))

        (setq interprogram-cut-function 'my-cut-function)
        (setq interprogram-paste-function 'my-paste-function))
    (message "command not found: xsel")))

