;; YaTeX
(setq YaTeX-kanji-code 4)
(setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "platex")
(setq dviprint-command-format "dvipdfmx %s ")
(add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1)))
