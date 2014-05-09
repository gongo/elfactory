;; http://bhby39.blogspot.jp/2011/12/emacs-gui.html

(unless window-system
  (defun my-cut-function (text &optional rest)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (defun my-paste-function ()
    (shell-command-to-string "pbpaste"))

  (setq interprogram-cut-function 'my-cut-function)
  (setq interprogram-paste-function 'my-paste-function))

