(defun disable-newline () (set (make-local-variable 'require-final-newline) nil))
(add-hook 'js2-mode-hook 'disable-newline)

(setq require-final-newline (not require-final-newline))

(provide 'setup-final-newline)

