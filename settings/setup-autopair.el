;; (require 'autopair)
;; (autopair-global-mode)

;; (autopair-mode -1)

;; (add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))

;; (add-hook 'c-mode-common-hook
;;           #'(lambda ()
;;               (setq autopair-dont-activate t)
;;               (autopair-mode -1)))

(require 'autopair)

(defvar autopair-modes '(r-mode ruby-mode js3-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(require 'paredit)
(defadvice paredit-mode (around disable-autopairs-around (arg))
  "Disable autopairs mode if paredit-mode is turned on"
  ad-do-it
  (if (null ad-return-value)
      (autopair-mode 1)
    (autopair-mode 0)
    ))

(ad-activate 'paredit-mode)

(provide 'setup-autopair)

