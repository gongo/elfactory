;;----------------------------------------
;; 各種 coding は UTF-8 に統一
;;----------------------------------------
(set-language-environment               "Japanese")
(prefer-coding-system                   'utf-8)
(set-buffer-file-coding-system          'utf-8)
(set-default-coding-systems             'utf-8)
(set-keyboard-coding-system             'utf-8)
(set-selection-coding-system            'utf-8)
(set-terminal-coding-system             'utf-8)
(setq buffer-file-coding-system         'utf-8)
(setq file-name-coding-system           'utf-8)

;;----------------------------------------
;; 色をつける
;;----------------------------------------
(global-font-lock-mode t)

;;----------------------------------------
;; ツールバーとメニューバーは表示しない
;;----------------------------------------
(tool-bar-mode -1)
(menu-bar-mode -1)

;;----------------------------------------
;; ステータスバーに行数、列数を表示
;;----------------------------------------
(line-number-mode t)
(column-number-mode t)

;;----------------------------------------
;; 対応する括弧をハイライト表示
;;----------------------------------------
(show-paren-mode t)

;;----------------------------------------
;; スクロールバーは無しで
;;----------------------------------------
(set-scroll-bar-mode nil)

;;----------------------------------------
;; 括弧が画面外にあるときには、括弧の中をハイライトする。
;;----------------------------------------
(set-face-background 'show-paren-match-face "gray10")
(set-face-foreground 'show-paren-match-face "SkyBlue")

;;----------------------------------------
;; 全角スペースとタブを可視化
;;
;;   ref. http://d.hatena.ne.jp/syohex/20110119/1295450495
;;----------------------------------------
(req whitespace
     (setq whitespace-style '(face tabs tab-mark spaces space-mark))
     (setq whitespace-display-mappings
           '((space-mark ?\x3000 [?\u25a1])
             (tab-mark  ?\t  [?\xBB ?\t] [?\\ ?\t])))
     (setq whitespace-space-regexp "\\(\x3000+\\)")
     (set-face-foreground  'whitespace-tab "#700000")
     (set-face-background  'whitespace-tab 'nil)
     (set-face-underline-p 'whitespace-tab t)
     (set-face-foreground  'whitespace-space "#700000")
     (set-face-background  'whitespace-space 'nil)
     (global-whitespace-mode 1))

;;----------------------------------------
;; 検索でマッチした箇所をハイライト表示
;;----------------------------------------
(setq search-highlight t)

;;----------------------------------------
;; Buffer list に同じファイル名がある場合は
;; ディレクトリ名も付加
;;----------------------------------------
(req uniquify
     (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;;----------------------------------------
;; 5 秒以上操作しなかったとき、カーソルを点滅させる
;;
;;   ref. http://d.hatena.ne.jp/hitode909/20110817/1313507601
;;----------------------------------------
(set-cursor-color "orange")
(setq blink-cursor-interval 0.05)
(setq blink-cursor-delay 5.0)
(blink-cursor-mode 1)

;;----------------------------------------
;; バックアップファイル (*~, #*) を生成しない
;;----------------------------------------
(setq backup-inhibited t)
(setq make-backup-files nil)

;;----------------------------------------
;; 自動保存したファイルを削除する。
;;----------------------------------------
(setq delete-auto-save-files t)

;;----------------------------------------
;; 自動セーブしない
;;----------------------------------------
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;;----------------------------------------
;; スタートアップ時のメッセージを抑制
;;----------------------------------------
(setq inhibit-startup-message t)

;;----------------------------------------
;; emacs server を起動
;;----------------------------------------
(req server
     (unless (server-running-p) (server-start)))

;;----------------------------------------
;; recentf を 30 秒毎に自動で保存
;;
;;   ref. http://d.hatena.ne.jp/tomoya/20110217/1297928222
;;----------------------------------------
(req server
     (setq recentf-max-saved-items 2000)
     (setq recentf-exclude '(".recentf"))
     (setq recentf-auto-cleanup 10)
     (run-with-idle-timer 30 t 'recentf-save-list)
     (recentf-mode 1))

;;----------------------------------------
;; ido mode on. あいまい検索も有効に
;;----------------------------------------
(req ido
     (ido-mode t)
     (setq ido-enable-flex-matching t))

;;----------------------------------------
;; 最後が改行で終わっていなければ、追加するか聞かれる
;;----------------------------------------
(setq require-final-newline 'visit)

;;----------------------------------------
;; デフォルトで tab を押してもタブ文字は入力されない(スペースで)
;; 入力したいときは C-q <tab> とかで
;;----------------------------------------
(setq-default indent-tabs-mode nil)

;;----------------------------------------
;; カーソル行をハイライト
;;----------------------------------------
(global-hl-line-mode t)

;;--------------------
;; cua-mode
;;--------------------
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;------------------------------
;; GUI の場合の処理
;;------------------------------
(when window-system (load-safe "ex-window-system-config.el"))


;;------------------------------
;; アーキテクチャ毎の処理
;;------------------------------
(load-safe
 (cond (darwin-p "ex-darwin.el")
       (linux-p  "ex-linux.el")))

;;------------------------------
;; 環境毎の設定
;;------------------------------
(load-safe "ex-env.el")

