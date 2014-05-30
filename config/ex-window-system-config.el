;;----------------------------------------
;; 指定したフォントが存在すれば使用する
;;----------------------------------------
(when (x-list-fonts "Ricty")
  (let* ((size 16)
         (asciifont "Ricty")
         (jpfont "Ricty")
         (h (* size 10))
         (fontspec)
         (jp-fontspec))
    (set-face-attribute 'default nil :family asciifont :height h)
    (setq fontspec (font-spec :family asciifont))
    (setq jp-fontspec (font-spec :family jpfont))
    (set-fontset-font nil 'japanese-jisx0208 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0212 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-1 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font nil '(#x0080 . #x024F) fontspec)
    (set-fontset-font nil '(#x0370 . #x03FF) fontspec)))

;;--------------------------------------------------
;; 切り取ったリージョンをクリップボードにコピーする
;;--------------------------------------------------
(setq x-select-enable-clipboard t)

;;----------------------------------------
;; shift + cursol で分割した window を移動
;;----------------------------------------
(req windmove
     (windmove-default-keybindings)
     (setq windmove-wrap-around t))
