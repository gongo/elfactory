(setq exec-path-from-shell-shell-name "zsh")

(when (memq window-system '(mac ns x))
  (let* ((libenv (cond (darwin-p "DYLD_FALLBACK_LIBRARY_PATH")
                       (linux-p  "LD_LIBRARY_PATH")))
         (envs `("PATH" "GOROOT" "GOPATH" "RBENV_ROOT" "HOMEBREW_ROOT" "LC_ALL" ,libenv)))
    (exec-path-from-shell-copy-envs envs)))
