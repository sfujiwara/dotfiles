(setq inhibit-startup-screen t)

;; Use package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Install init-loader
(unless (package-installed-p 'init-loader)
  (package-install 'init-loader))

;; Use init-loader
(require 'init-loader)
