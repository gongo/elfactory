(eval-when-compile (require 'cl)) 
(require 'org)

(setq
 org-directory "~/Work/orgfiles"

 ;;------------------------------
 ;; Basic
 ;;
 ;; DONE になった時、タイムスタンプを付加する
 org-use-fast-todo-selection t
 ;;
 ;; 登録されてない日は `org-timeline' で表示しない
 org-timeline-show-empty-dates nil
 ;;
 ;; カレンダーは Sunday(0) から表示する
 calendar-week-start-day 0
 ;;
 ;; 階層構造によるタグの継承は行わない
 org-use-tag-inheritance nil
 ;;
 ;; `org-add-note' 時、ファイルの末尾に追記していく
 org-reverse-note-order nil
 ;;
 ;; タグ選択時、同時に複数選択できる(non-nil だと押したら即閉じる)
 org-fast-tag-selection-single-key nil

 ;;------------------------------
 ;; Agenda `org-agenda'
 ;;
 ;; アジェンダの項目並び替え
 org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up)))
 ;;
 ;; アジェンダは一画面一週間分表示
 org-agenda-span 7
 ;;
 ;; アジェンダで定期スケジュールを全部表示する(例えば .+1d だったら、毎日表示する)
 org-agenda-repeating-timestamp-show-all t
 ;;
 ;; アジェンダは別ウィンドウで開く
 org-agenda-window-setup (quote other-window)
 ;;
 ;; アジェンダから抜けた時に、画面の構成をアジェンダ表示前に戻す
 org-agenda-restore-windows-after-quit t
 ;;
 ;; 登録されていない日もアジェンダで表示する
 org-agenda-show-all-dates t
 ;;
 ;; スケジュールやデッドラインアイテムは DONE になっていれば表示しない
 org-agenda-skip-deadline-if-done t
 org-agenda-skip-scheduled-if-done t
 ;;
 ;; アジェンダは Monday(1) から表示する
 org-agenda-start-on-weekday 1
 ;;
 ;; 期日7日前以内のタスクはアジェンダで In 表示
 org-deadline-warning-days 2
 ;;
 ;; `org-agenda' の t や T コマンドで表示される TODO 一覧に、
 ;; デッドラインやスケジュール、時間が記入されているものは表示しない
 org-agenda-todo-ignore-deadlines t
 org-agenda-todo-ignore-scheduled t
 org-agenda-todo-ignore-with-date t
 ;;------------------------------


 ;;------------------------------
 ;; Export
 ;;
 ;; HTML エクスポート 時のあれ
 org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">"
 ;;
 ;; エクスポートする時は基本日本語
 org-export-default-language "ja"
 ;;------------------------------
 )

(setq org-default-notes-file (concat org-directory "/.notes"))
(setq org-agenda-files (loop for f in '("birthday" "newgtd" "private")
                             collect (format "%s/%s.org" org-directory f)))

(defun gtd ()
  (interactive)
  (find-file (concat org-directory "/newgtd.org")))

;;--------------------------------------------------
;; set-key
;;--------------------------------------------------
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c g") 'gtd)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(customize-set-variable 'org-file-apps
                        '(("pdf" . "evince %s")))

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . "evince %s")))

(setq org-export-latex-default-packages-alist
      '(("AUTO" "inputenc" t)
        ("T1" "fontenc" t)
        ("" "fixltx2e" nil)
        ("dvipdfmx" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "wrapfig" nil)
        ("" "soul" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "latexsym" t)
        ("" "amssymb" t)
        ("dvipdfmx" "hyperref" nil)
        "\\tolerance=1000"))

(eval-after-load 'org-latex
  '(progn
     (setq org-export-latex-classes
           (append org-export-latex-classes
                   '(
                     ("jarticle"
                      "\\documentclass{jsarticle}"
                      ("\\section{%s}" . "\\section*{%s}")
                      ("\\subsection{%s}" . "\\subsection*{%s}")
                      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                      ("\\paragraph{%s}" . "\\paragraph*{%s}")
                      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                      )
                     )
                   ))
     (setq org-latex-to-pdf-process
           '("platex %b" "platex %b" "platex %b" "dvipdfmx %b"))
     ))
