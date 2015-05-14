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

(global-unset-key (kbd "C-c C-f"))
;; No more scrolling surprises
;;(global-unset-key (kbd "C-v"))
;;(global-unset-key (kbd "M-v"))

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
(require 'setup-highlight)
(require 'setup-column-marker)
(require 'setup-indent-guide)

(require 'epa-file)
(epa-file-enable)

(setq initial-scratch-message "
			 	(つ -‘ _ ‘- )つ 
			 Welcome to my Emacs
				The God Editor!
						-----Aby Chan
	
                           



                                                                    ︻╦̵̵͇̿̿̿̿══╤─






           ̿' ̿'\̵͇̿̿\з=(•̪●)=ε/̵͇̿̿/'̿''̿ ̿

                                       ▐▬▬▬▌
")

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path
      '(
    "/usr/local/bin"
    "/usr/bin"
    "/home/tyan/USR/node-v0.12.1-linux-x64/bin"
    ))


    (setq mouse-wheel-scroll-amount '(4 ((shift) . 4))) ;; one line at a time
    
    (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
    (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
    (setq scroll-step 1) ;; keyboard scroll one line at a time
