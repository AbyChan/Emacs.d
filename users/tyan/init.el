;; Default js indentation levels
(setq-default js2-basic-offset 2)
(setq js-indent-level 2)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(set-variable 'fancy-startup-text 'hi)
;; Monday ftw
(set-variable 'calendar-week-start-day 1)

;; Font size
(define-key global-map (kbd "M-s +") 'zoom-in)
(define-key global-map (kbd "M-s -") 'zoom-out)

;; No more scrolling surprises
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "M-v"))

;; No graphics please o.O
(setq speedbar-use-images nil)

;; god-mode tweaks
;(god-mode)
(defun my-update-cursor ()
  (setq cursor-type (if (or (not god-global-mode)
                            god-local-mode
                            buffer-read-only)
                        'box 'bar)))

;(add-hook 'post-command-hook 'my-update-cursor)

(defun my-delete-region-and-go-to-insert-mode ()
  (delete-region (region-beginning) (region-end))
  (god-local-mode -1))

(setq magit-last-seen-setup-instructions "1.4.0")

(require 'setup-auto-complete)
(require 'setup-web-beautify)
(require 'setup-sr-speedbar)
(require 'setup-autopair)
(require 'sass-mode)
(require 'setup-jshint)

(setq initial-scratch-message "
			 	(つ -‘ _ ‘- )つ 
			 Welcome to my Emacs
				The God of Editor!
						-----Aby Chan
	
                           



                                                                    ︻╦̵̵͇̿̿̿̿══╤─






           ̿' ̿'\̵͇̿̿\з=(•̪●)=ε/̵͇̿̿/'̿''̿ ̿

                                       ▐▬▬▬▌
")
