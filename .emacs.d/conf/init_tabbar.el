;; tabbar
(require 'tabbar)
(tabbar-mode)
(global-set-key [(control tab)] 'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)
(setq tabbar-buffer-groups-function nil)

;; GUIで直接ファイルを開いた場合フレームを作成しない
(add-hook 'before-make-frame-hook
          (lambda ()
            (when (eq tabbar-mode t)
              (switch-to-buffer (buffer-name))
              (delete-this-frame))))
