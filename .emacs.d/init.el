;; Configurations for package.el.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package automatically.
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)

;; Show column and line number in mode line.
(column-number-mode t)
(line-number-mode t)

;; Show line numbers.
(global-linum-mode t)
(setq linum-format "%4d ")

;; Highlight parentheses.
(show-paren-mode t)

;; Use theme.
(load-theme 'misterioso t)
;; (load-theme 'tsdh-dark t)
;; (load-theme 'tango-dark t)

;; Elpy.
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; Automatically added.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elpy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
