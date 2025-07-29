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
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; Whitespaces
(global-whitespace-mode 1)
(setq-default whitespace-global-modes '(not shell-mode dired-mode))
(setq whitespace-style '(
  ;; face
  trailing
  space-mark
  tab-mark
  missing-newline-at-eof
  empty
))
(setq whitespace-action '(auto-cleanup))

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
  (python-mode . eglot-ensure)
)

;; Language Server Protocol with lsp-mode
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :custom
  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  (lsp-enable-symbol-highlighting t)      ;; 1
  (lsp-ui-doc-enable nil)                 ;; 2-1
  (lsp-ui-doc-show-with-cursor t)         ;; 2-2
  (lsp-ui-doc-show-with-mouse t)          ;; 2-3
  (lsp-lens-enable t)                     ;; 3
  (lsp-headerline-breadcrumb-enable nil)  ;; 4
  (lsp-ui-sideline-enable t)              ;; 5-1
  (lsp-ui-sideline-show-code-actions t)   ;; 5-2
  (lsp-modeline-code-actions-enable t)    ;; 7
  (lsp-diagnostics-provider :flycheck)    ;; 8
  (lsp-ui-sideline-enable t)              ;; 9-1
  (lsp-ui-sideline-show-diagnostics t)    ;; 9-2
  (lsp-eldoc-enable-hover t)              ;; 10
  (lsp-modeline-diagnostics-enable t)     ;; 11
  (lsp-signature-auto-activate t)         ;; 12
  (lsp-signature-render-documentation t)  ;; 13
  ;; (lsp-completion-provider :company)   ;; 14
  (lsp-completion-show-detail t)          ;; 15
  (lsp-completion-show-kind t)            ;; 16
  (lsp-disabled-clients '(tfls))
  (lsp-semantic-tokens-enable t)
  (lsp-semantic-tokens-honor-refresh-requests t)
  (lsp-terraform-ls-providers-position-params t)
  (lsp-terraform-ls-prefill-required-fields t)
  ;; :hook
  ;; (terraform-mode . lsp-deferred)
  ;; (go-mode . lsp-deferred)
)

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
  :bind
  (:map global-map
    ("C-x t t" . treemacs)))

;; Use nerd icons for treemacs
(use-package treemacs-nerd-icons
  :ensure t
  :config
  (treemacs-load-theme "nerd-icons"))

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
