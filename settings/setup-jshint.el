(require 'flymake-gjshint)
;;(add-hook 'js2-mode-hook 'flymake-gjshint:load)
;;(add-hook 'js3-mode-hook 'flymake-gjshint:load)
;;(add-hook 'javascript-mode-hook 'flymake-gjshint:load)

(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'js3-mode-hook 'flymake-jshint-load)
(add-hook 'javascript-mode-hook 'flymake-jshint-load)



(provide 'setup-jshint)

