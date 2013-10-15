;; ここちょっと納得いかないけど……
(setenv "SHELL"
        (cond
         (linux-p "/usr/bin/zsh")
         (t "/Users/gongo/.homebrew/bin/zsh")))

(when (memq window-system '(mac ns x))
  (let* ((libenv (cond (darwin-p "DYLD_FALLBACK_LIBRARY_PATH")
                       (linux-p  "LD_LIBRARY_PATH")))
         (envs `("PATH" "GOROOT" "GOPATH" ,libenv)))
    (exec-path-from-shell-copy-envs envs)))
