;; Aspell
;; ispellをaspellに置き換える
(setq-default ispell-program-name "aspell")
;; 日本語ファイル中のスペルチェックを可能にする
(eval-after-load "ispell"
 '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

(setq-default flyspell-mode t)
