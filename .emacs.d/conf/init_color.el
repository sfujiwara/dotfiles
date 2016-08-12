;; テーマ設定
;(load-theme 'adwaita t)
;(load-theme 'wombat t)
;(load-theme 'misterioso t)
(load-theme 'tango-dark t)
;(load-theme 'tsdh-dark t)
;(load-theme 'wheatgrass t)
;(load-theme 'deeper-blue t)


;; 選択行のハイライト
;(setq hl-line-face 'underline)

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#CC0066"))
    (t
     ()))
  "*Face used by hl-line.")

(setq hl-line-face 'hlline-face)
(global-hl-line-mode)


;; フレーム透過設定
;(add-to-list 'default-frame-alist '(alpha . (0.75 0.75)))
;(set-frame-parameter nil 'alpha 80)
(set-frame-parameter (selected-frame) 'alpha '(0.85))

