(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;; ;; melpa.el のインストール
(unless (require 'melpa nil t)
  (switch-to-buffer
   (url-retrieve-synchronously
    "https://raw.github.com/milkypostman/melpa/master/melpa.el"))
  (package-install-from-buffer  (package-buffer-info) 'single))

(require 'melpa)

;; archive 情報を更新
;; (package-refresh-contents)

