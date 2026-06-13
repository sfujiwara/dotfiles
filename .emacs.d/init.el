;; Configurations for package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package automatically
(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)

;; General settings
(global-display-line-numbers-mode t)  ;; Show line numbers
(global-hl-line-mode t)               ;; Highlight current line
(global-auto-revert-mode t)           ;; Update files automatically
(menu-bar-mode 0)                     ;; Not to show menu bar
(electric-pair-mode t)                ;; Insert closing bracket
(column-number-mode t)                ;; Show column number in mode line
(setq dired-kill-when-opening-new-dired-buffer t)
(setq ring-bell-function 'ignore)     ;; Not to ring bell
(setq make-backup-files nil)          ;; Not to create backup
(setq auto-save-default nil)          ;; Not to create backup
(setq mac-option-modifier 'meta)      ;; Use Mac option key as meta key
(setq scroll-conservatively 1)        ;; Scroll
(setq use-short-answers t)            ;; yes-or-no --> y-or-n
(windmove-default-keybindings)        ;; Windmove
(setq-default indent-tabs-mode nil)

;; show-paren-mode
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; tab-line-mode
(global-tab-line-mode 1)
(global-set-key (kbd "C-<right>") 'tab-line-switch-to-next-tab)
(global-set-key (kbd "C-<left>") 'tab-line-switch-to-prev-tab)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(set-face-attribute 'tab-line-tab-current nil
  :foreground "#fdf6e3"
  :background "#cb4b16")
(set-face-attribute 'tab-line-tab-modified nil
  :foreground "#fdf6e3"
  :background "#6c71c4")
(set-face-attribute 'tab-line-tab-inactive nil
  :foreground "#93a1a1"
  :background "#002b36")

;; Whitespaces
(global-whitespace-mode 1)
(setq-default whitespace-global-modes '(not shell-mode dired-mode))
(setq whitespace-style '(
  ;; face
  trailing
  ;; space-mark
  tab-mark
  missing-newline-at-eof
  empty
))
(setq whitespace-action '(auto-cleanup))

;; blamer
(use-package blamer
  :ensure t
  :bind (("s-i" . blamer-show-commit-info)
         ("C-c i" . blamer-show-posframe-commit-info))
  :defer 0
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 140
                    :italic t)))
  :config
  (global-blamer-mode 1))

;; breadcrumb-mode
(use-package breadcrumb
  :ensure t
  :config
  (breadcrumb-mode 1))

;; Theme
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode css-mode html-mode))

(use-package helm
  :ensure t
  :config
  (setq helm-split-window-inside-p t)
  (setq helm-use-frame-when-more-than-two-windows nil)
  (helm-autoresize-mode 1))

(use-package which-key
  :ensure t
  :custom
  (which-key-idle-delay 0.1)
  (which-key-idle-secondary-delay 0.1)
  :config
  (which-key-mode))

(use-package vertico
  :ensure t
  :custom
  (vertico-count 20)
  :init
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

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
  :custom
  (company-selection-wrap-around t)
  (company-show-numbers nil)
  (company-idle-delay 0)
  (company-auto-expand t)
  (completion-ignore-case t)
  (lsp-completion-provider :capf)
  (company-minimum-prefix-length 1))

;; Flycheck
(use-package flycheck :ensure t)

;; yasnippet is required for LSP completion
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode))

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
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
  (add-to-list 'eglot-server-programs '(terraform-mode . ("terraform-ls" "serve")))
  :hook
  (terraform-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  (python-mode . eglot-ensure))

;; jsonrpc
(use-package jsonrpc
  :config
  (setq jsonrpc-default-request-timeout 3000)
  (fset #'jsonrpc--log-event #'ignore))

;; Terraform
(use-package terraform-mode
  :ensure t
  :hook
  ('terraform-mode-hook . 'terraform-format-on-save-mode))

;; Go
(use-package go-mode
  :ensure t
  :hook
  ('before-save-hook . 'gofmt-before-save))

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config
  (setq indent-tabs-mode nil)
  (setq tab-width 2))

;; Docker
(use-package dockerfile-mode :ensure t)

;; Markdown
(use-package markdown-mode :ensure t)

;; JSON
(use-package json-mode
  :ensure t
  :custom
  (js-indent-level 2))

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
  :custom
  (neo-smart-open t)
  (neo-show-hidden-files t)
  (neo-autorefresh t)
  (neo-theme (if (display-graphic-p) 'icons 'nerd-icons))
  (neo-window-width 30)
  :config
  (add-hook 'neotree-mode-hook '(lambda () (display-line-numbers-mode -1)))
  (global-set-key [f8] 'neotree-toggle))

;; Treemacs
(use-package treemacs
  :ensure t
  :custom
  ;; (treemacs-project-follow-cleanup t)
  (treemacs-width 30)
  :hook
  (treemacs-mode . (lambda () (display-line-numbers-mode -1)))
  :bind
  (:map global-map ("C-x t t" . treemacs)))

;; Use nerd icons for treemacs
(use-package treemacs-nerd-icons
  :ensure t
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package consult
  :ensure t)

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; GitHub Copilot
;; (use-package copilot
;;   :vc (:url "https://github.com/copilot-emacs/copilot.el" :rev :newest :branch "main")
;;   :config
;;   (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
;;   (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
;;   (define-key copilot-completion-map (kbd "M-f") 'copilot-accept-completion-by-word)
;;   (define-key copilot-completion-map (kbd "M-n") 'copilot-next-completion)
;;   (define-key copilot-completion-map (kbd "M-p") 'copilot-previous-completion)
;;   (setopt copilot-max-char-warning-disable t)
;;   (setopt copilot-indent-offset-warning-disable t)
;;   (add-hook 'prog-mode-hook 'copilot-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access nil nil nil "Customized with use-package company")
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
