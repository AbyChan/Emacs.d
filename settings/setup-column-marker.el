(require 'column-marker)

(add-hook 'js2-mode-hook (lambda () (interactive) (column-marker-1 80)))

(global-set-key [?\C-c ?m] 'column-marker-1)

(provide 'setup-column-marker)
