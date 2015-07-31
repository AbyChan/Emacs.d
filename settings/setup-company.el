(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

(add-to-list 'company-backends 'company-tern)  

;;(global-set-key "C-." 'company-complete-common)
(setq company-idle-delay 0)


;; (defun company-my-frontend (command)
;;   (case command
;;     (pre-command (echo "%s" (car company-candidates)))
;;     (post-command (echo "%s" (car company-candidates)))
;;     (hide (echo ""))))

;; (add-to-list 'company-frontends 'company-my-frontend)

(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(setq company-minimum-prefix-length 1)

(provide 'setup-company)

