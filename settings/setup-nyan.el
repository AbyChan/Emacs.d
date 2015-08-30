(setq my-active-modeline-image "/home/tyan/.emacs.d/nyan.png")
(setq my-active-modeline-image-width 32)

(defconst active-modeline-image
  (create-image my-active-modeline-image 'png nil
                                 :ascent 'center))
(defconst mode-line-img
  (propertize (make-string my-active-modeline-image-width #x20)
              'display active-modeline-image))

(defvar my-current-win nil)
(defun set-current-window (windows)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq my-current-win (selected-window))))
(add-function :before pre-redisplay-function #'set-current-window)

(add-hook 'after-init-hook
          (lambda ()
            (setq-default
             mode-line-format
             (append mode-line-format
                     `((:eval
                        (if (eq my-current-win (get-buffer-window))
                            ,mode-line-img)))))))

(provide 'setup-nyan)
