;; http://d.hatena.ne.jp/l1o0/20100429/1272557315

(unless window-system
  (if (executable-find "xclip")
      (progn
        (defun my-cut-function (text &optional rest)
          (interactive)
          (let ((process-connection-type nil))
            (let ((proc (start-process "xclip" "*Messages*" "xclip")))
              (process-send-string proc text)
              (process-send-eof proc))))

        (defun my-paste-function ()
          (shell-command-to-string "xclip -o"))

        (setq interprogram-cut-function 'my-cut-function)
        (setq interprogram-paste-function 'my-paste-function))
    (message "command not found: xclip")))

