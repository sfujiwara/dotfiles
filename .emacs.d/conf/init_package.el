(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto install
(require 'cl)
(defvar installing-package-list
  '(
    ;; package list
    auto-complete
    ecb
    el-get
    ess
    haskell-mode
    highlight-indentation
    ;hl-line+
    jedi
    python-mode
    tabbar
    yatex
    ))
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
