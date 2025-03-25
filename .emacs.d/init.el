;; Configurations for package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Resolve the error on ABCI
;; https://emacs.stackexchange.com/questions/61997/how-do-i-fix-incomprehensible-buffer-error-when-running-list-packages
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

;; Install use-package automatically
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)

;; General settings
(global-display-line-numbers-mode t)  ;; Show line numbers
(global-hl-line-mode t)               ;; Highlight current line
(menu-bar-mode 0)                     ;; Not to show menu bar
(show-paren-mode t)                   ;; Highlight parentheses
(electric-pair-mode t)                ;; Insert closing bracket
(column-number-mode t)                ;; Show column number in mode line
(line-number-mode t)                  ;; Show line number in mode line
(setq ring-bell-function 'ignore)     ;; Not to ring bell
(setq make-backup-files nil)          ;; Not to create backup
(setq auto-save-default nil)          ;; Not to create backup
(setq mac-option-modifier 'meta)      ;; Use Mac option key as meta key
(setq scroll-conservatively 1)        ;; Scroll

;; windmove
(windmove-default-keybindings)

;; Keybinds
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; Whitespaces
(global-whitespace-mode 1)
(setq whitespace-style '(
  face
  trailing
  tabs
  spaces
  empty
  space-mark
  ;; tab-mark  ;; It should be off for nerd-icons-dired-mode
))

;; Theme
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

;; Beacon
(use-package beacon
  :ensure t
  :custom
  (beacon-color "yellow")
  :config
  (beacon-mode t)
  (setq beacon-blink-when-focused t)
  (setq beacon-blink-when-window-scrolls nil))

;; Company
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-refs-show-commit-count 'all)
  (setq magit-log-buffer-file-locked t))

;; Language Server Protocol with Eglot
(use-package eglot
  :ensure t
  :config
  ;; (add-to-list 'eglot-server-programs '(python-mode . ("ruff" "server")))
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
  (add-to-list 'eglot-server-programs '(terraform-mode . ("terraform-ls" "serve")))
)

;; Python
(use-package python-mode
  :ensure nil
  :hook
  (python-mode . eglot-ensure))

;; Terraform
(use-package terraform-mode
  :ensure t
  :hook
  (terraform-mode . eglot-ensure))

;; Markdown
(use-package markdown-mode :ensure t)

;; YAML
(use-package yaml-mode :ensure t)

;; diff-hl
(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (unless (window-system) (diff-hl-margin-mode))
  (diff-hl-flydiff-mode +1)
  :custom-face
  (diff-hl-insert ((t (:background "#2aa198"))))
  (diff-hl-delete ((t (:background "#dc322f"))))
  (diff-hl-change ((t (:background "#b58900")))))

;; all-the-icons
(use-package all-the-icons :ensure t)

;; nerd-icons
(use-package nerd-icons :ensure t)

;; nerd-icons-dired-mode
(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))

;; emacs-neotree
(use-package neotree
  :ensure t
  :init
  (setq-default neo-keymap-style 'concise)
  :config
  (setq neo-smart-open t)
  (setq neo-create-file-auto-open t)
  (setq neo-show-hidden-files t)
  (setq neo-window-width 25)
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd-icons))
  (add-hook 'neotree-mode-hook '(lambda () (display-line-numbers-mode -1)))
  (global-set-key [f8] 'neotree-toggle))

;; Automatically added
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
