;; Configurations for package.el.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Resolve the error on ABCI.
;; https://emacs.stackexchange.com/questions/61997/how-do-i-fix-incomprehensible-buffer-error-when-running-list-packages
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

;; Install use-package automatically.
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)

;; Show column and line number in mode line.
(column-number-mode t)
(line-number-mode t)

;; Show line numbers.
(global-display-line-numbers-mode t)

;; Highlight parentheses.
(show-paren-mode t)

;; Not to create backup.
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Use theme.
(load-theme 'misterioso t)
;; (load-theme 'tsdh-dark t)
;; (load-theme 'tango-dark t)

;; Elpy.
(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  :init
  (elpy-enable))

;; Poetry.el.
(use-package poetry
  :ensure t)

;; git-gutter.el.
(use-package git-gutter
    :ensure t
    :custom
    (git-gutter:modified-sign "=")
    (git-gutter:added-sign "+")
    (git-gutter:deleted-sign "-")
    :custom-face
    (git-gutter:modified    ((t (:background "blue"))))
    (git-gutter:added    ((t (:background "green"))))
    (git-gutter:deleted  ((t (:background "red"))))
    :config
    (global-git-gutter-mode +1))

;; emacs-neotree.
(use-package neotree
  :ensure t
  :init
  (setq-default neo-keymap-style 'concise)
  :config
  (setq neo-smart-open t)
  (setq neo-create-file-auto-open t)
  (setq neo-show-hidden-files t)
  (global-set-key [f8] 'neotree-toggle))

;; Automatically added.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(neotree elpy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
