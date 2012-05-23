;;----------------------------------------
;; リージョン内で正規置換
;;
;;   ref. http://cee-ux49.cee.uiuc.edu/cee490/.emacs
;;----------------------------------------
(defun replace-regexp-region (regexp replacement)
  (interactive "*sReplace region: \nswith: ")
  (save-excursion
    (narrow-to-region (region-beginning) (region-end))
    (goto-char (point-min))
    (replace-regexp regexp replacement)
    (widen)))

;;----------------------------------------
;; いろいろマクロ
;;
;;   ref. http://www.sodan.org/~knagano/emacs/dotemacs.html
;;----------------------------------------
(defmacro exec-if-bound (sexplist)
  "関数が存在する時だけ実行する。（car の fboundp を調べるだけ）"
  `(if (fboundp (car ',sexplist)) ,sexplist))

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
(defmacro append-to-list (to lst) 
 `(setq ,to (append ,lst ,to)))

(defmacro req (lib &rest body)
  `(when (locate-library ,(symbol-name lib))
     (require ',lib) ,@body))

(defmacro lazyload (func lib &rest body)
  `(when (locate-library ,lib)
     ,@(mapcar (lambda (f) `(autoload ',f ,lib nil t)) func)
     (eval-after-load ,lib
       '(progn
          ,@body))))
