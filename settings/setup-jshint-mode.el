(add-to-list 'load-path "~/.emacs.d/site-lisp/jshint-mode")
(require 'flymake-jshint)
(add-hook 'js2-mode-hook
     (lambda () (flymake-mode t)))


(provide 'setup-jshint-mode)

