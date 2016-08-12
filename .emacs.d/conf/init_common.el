

;; 行と桁の表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format '(:eval (count-lines-and-chars)))
;; 行番号の表示
(global-linum-mode t)

;; カーソルキーのスクロールを1行ずつにする
(setq scroll-step 1)
;; マウスホイールのスクロールを1行ずつにする
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 1))
(defun scroll-up-with-lines ()
   "" (interactive) (scroll-up 1))
(global-set-key [mouse-4] 'scroll-down-with-lines)
(global-set-key [mouse-5] 'scroll-up-with-lines)

;; Region の上書き
(delete-selection-mode t)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format (format "%%f - Emacs"))

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

(require 'whitespace)
;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)
