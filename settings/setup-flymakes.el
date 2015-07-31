
;; (require 'flymake-jslint)
;;     (add-hook 'js-mode-hook 'flymake-jslint-load)

(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

(require 'flymake-css)
(add-hook 'css-mode-hook 'flymake-css-load)

(require 'flymake-css)
(add-hook 'web-mode-hook 'flymake-css-load)

(provide 'setup-flymakes)
