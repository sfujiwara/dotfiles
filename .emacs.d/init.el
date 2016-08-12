(setq load-path (append '("~/.emacs.d/conf") load-path))

;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/Library/TeX/texbin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 ;; PATH と exec-path に同じ物を追加します
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))


;; Load configuration files
(load "init_package")
(load "init_common")
(load "init_color")
(load "init_yatex")
(load "init_aspell")
(load "init_tabbar")
(load "init_auto-complete")
