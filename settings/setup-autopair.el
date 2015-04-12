 (require 'autopair)
  (autopair-global-mode)


(add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))

(add-hook 'c-mode-common-hook
          #'(lambda ()
            (setq autopair-dont-activate t)
            (autopair-mode -1)))

(provide 'setup-autopair)
