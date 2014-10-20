;;----------------------------------------
;; いろいろマクロ
;;
;;   ref. http://www.sodan.org/~knagano/emacs/dotemacs.html
;;----------------------------------------
(defmacro defun-add-hook (hookname &rest sexplist)
  "add-hook のエイリアス。引数を関数にパックして hook に追加する。"
  `(add-hook ,hookname (function (lambda () ,@sexplist))))

(defun load-safe (loadlib)
  "安全な load。読み込みに失敗してもそこで止まらない。"
  ;; missing-ok で読んでみて、ダメならこっそり message でも出しておく
  (let ((load-status (load loadlib t)))
    (or load-status
        (message (format "[load-safe] failed %s" loadlib)))
    load-status))

;;----------------------------------------
;; いろいろマクロ
;;
;;   ref. http://e-arrows.sakura.ne.jp/2010/03/macros-in-emacs-el.html
;;----------------------------------------
(defmacro req (lib &rest body)
  `(when (locate-library ,(symbol-name lib))
     (require ',lib) ,@body))
