;; C++とCの共通設定
(setq-default c-basic-offset 4     ;;基本インデント量4
              tab-width 4          ;;タブ幅4
              indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

;; C++
(defun add-c++-mode-conf ()
  (c-set-style "stroustrup")  ;;スタイルはストラウストラップ
  (show-paren-mode t))        ;;カッコを強調表示する
(add-hook 'c++-mode-hook 'add-c++-mode-conf)
