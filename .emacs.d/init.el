;; settings for package.el
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; refresh if needed
(unless package-archive-contents (package-refresh-contents))

;; install init-loader
(package-install 'init-loader)

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; avoid to write package-selected-packages in init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))
