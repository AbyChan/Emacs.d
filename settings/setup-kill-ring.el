
;;(shell-command-on-region ())

(defvar pbcopy-program (executable-find "pbcopy")
  "Name of Pbcopy program tool.")
(defvar pbpaste-program (executable-find "pbpaste")
  "Name of Pbpaste program tool.")

(defvar pbcopy-select-enable-clipboard t
  "Non-nil means cutting and pasting uses the clipboard.
This is in addition to, but in preference to, the primary selection.")

(defvar pbcopy-last-selected-text-clipboard nil
  "The value of the CLIPBOARD X selection from pbcopy.")

(defvar pbcopy-last-selected-text-primary nil
  "The value of the PRIMARY X selection from pbcopy.")

(defun pbcopy-set-selection (type data)
  "TYPE is a symbol: primary, secondary and clipboard.
See `x-set-selection'."
  (when pbcopy-program
    (let* ((process-connection-type nil)
           (proc (start-process "pbcopy" nil "pbcopy")))
      (process-send-string proc data)
      (process-send-eof proc))))

(defun pbcopy-select-text (text &optional push)
  "See `x-select-text'."
  (pbcopy-set-selection 'primary text)
  (setq pbcopy-last-selected-text-primary text)
  (when pbcopy-select-enable-clipboard
    (pbcopy-set-selection 'clipboard text)
    (setq pbcopy-last-selected-text-clipboard text)))

(defun pbcopy-selection-value ()
  "See `x-cut-buffer-or-selection-value'."
  (when pbcopy-program
    (let (clip-text primary-text)
      (when pbcopy-select-enable-clipboard
        (setq clip-text (shell-command-to-string "pbpaste"))
        (setq clip-text
              (cond ;; check clipboard selection
               ((or (not clip-text) (string= clip-text ""))
                (setq pbcopy-last-selected-text-primary nil))
               ((eq      clip-text pbcopy-last-selected-text-clipboard) nil)
               ((string= clip-text pbcopy-last-selected-text-clipboard)
                ;; Record the newer string,
                ;; so subsequent calls can use the `eq' test.
                (setq pbcopy-last-selected-text-clipboard clip-text)
                nil)
               (t (setq pbcopy-last-selected-text-clipboard clip-text)))))
      (setq primary-text (shell-command-to-string "pbpaste"))
      (setq primary-text
            (cond ;; check primary selection
             ((or (not primary-text) (string= primary-text ""))
              (setq pbcopy-last-selected-text-primary nil))
             ((eq      primary-text pbcopy-last-selected-text-primary) nil)
             ((string= primary-text pbcopy-last-selected-text-primary)
              ;; Record the newer string,
              ;; so subsequent calls can use the `eq' test.
              (setq pbcopy-last-selected-text-primary primary-text)
              nil)
             (t (setq pbcopy-last-selected-text-primary primary-text))))
      (or clip-text primary-text))))

;;;###autoload
(defun turn-on-pbcopy ()
  (interactive)
  (setq interprogram-cut-function 'pbcopy-select-text)
  (setq interprogram-paste-function 'pbcopy-selection-value))

;;;###autoload
(defun turn-off-pbcopy ()
  (interactive)
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil))


(add-hook 'minibuffer-setup-hook'
          (lambda ()
            (make-local-variable 'kill-ring)))

(add-hook 'terminal-init-xterm-hook 'turn-on-pbcopy)

(provide 'setup-kill-ring)
