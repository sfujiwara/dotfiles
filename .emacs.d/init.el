(require 'package)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;;; add melpa and orgmode for packages
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "http://melpa.org/packages/")
    ("org" . "http://orgmode.org/elpa/")))

(unless package-archive-contents
  (package-refresh-contents))
;;;;; ensure to use use-package
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

;;; all-the-icons-dired
(use-package all-the-icons-dired :quelpa t
  :defer t ; M-x all-the-icons-install-fonts
  :config
  ;;; font-lock+
  (use-package font-lock+ :quelpa (font-lock+ :fetcher wiki))
  ;; :hook (dired-mode . all-the-icons-dired-mode)
  )

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

;;;;; init-loader
(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/inits"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (init-loader use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
