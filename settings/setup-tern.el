(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(add-to-list 'load-path "/usr/local/lib/node_modules/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

(provide 'setup-tern)

