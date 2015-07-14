
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 2)
            (setq python-indent 2)))


(provide 'setup-python)
