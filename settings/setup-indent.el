(setq auto-indent-on-visit-file t)
(require 'auto-indent-mode)
(add-hook 'js2-mode-hook
          '(lambda ()
             (define-key c-mode-map "\C-m" 'newline-and-indent)))

(add-hook 'js3-mode-hook
          '(lambda ()
             (define-key c-mode-map "\C-m" 'newline-and-indent)))

(auto-indent-global-mode)

(setq auto-indent-mode-untabify-on-yank-or-paste 'tabify)

(setq auto-indent-untabify-on-save-file 'tabify)

(setq auto-indent-newline-function 'newline-and-indent)

(add-hook 'js2-mode-hook 'auto-indent-mode)

(provide 'setup-indent)
