(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; auto install
(require 'cl)
(defvar installing-package-list
  '(
    ;; package list
    auto-complete
    ess
    haskell-mode
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
