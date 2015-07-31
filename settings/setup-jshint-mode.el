(add-to-list 'load-path "~/.emacs.d/site-lisp/jshint-mode")
(require 'flymake-jshint)
(add-hook 'js2-mode-hook
     (lambda () (flymake-mode t)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'js2-mode-hook 'flycheck-mode)
(setq flycheck-jshintrc "~/.jshintrc")

(provide 'setup-jshint-mode)

