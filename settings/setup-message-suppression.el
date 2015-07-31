


(defgroup message-suppression nil
  "Customization options for selective message suppression."
  :prefix "message-suppression")

(defcustom message-suppression-enabled nil
  "Whether or not to suppress messages listed in
`message-suppress-these'."
  :group 'message-suppression
  :tag "Suppress some messages?"
  :type '(choice (const :tag "No" nil)
                 (const :tag "Yes" t)))

(defcustom message-suppression-to-messages-buffer t
  "Whether or not to insert messages suppressed from the
minibuffer into the *Messages* buffer."
  :group 'message-suppression
  :tag "Insert suppressed messages into *Messages* buffer?"
  :type '(choice (const :tag "No" nil)
                 (const :tag "Yes" t)))

(defcustom message-suppression-these nil
  "A list of messages which the `message-except-these' advice
should suppress from being echoed in the minibuffer. Messages
are matched by `member', i.e., only exact strings match.

NB! Per the Emacs manual, calls from C code to primitives (such
as `message') ignore advice entirely, which means some messages
cannot be suppressed by this mechanism. ('Advising
Functions' in the Emacs Lisp Reference Manual, q.v.)"
  :group 'message-suppression
  :tag "Messages to suppress"
  :type '(repeat (string))
  :link '(info-link "(elisp)Advising Functions"))

(defadvice message (around message-suppress-advice)
  "Suppress messages listed in `message-suppress-these' from being
  echoed in the minibuffer."
  (let ((message-string nil)
        (current-buffer nil))
    (if (and message-suppression-enabled
             (length (ad-get-args 0))
             (stringp (car (ad-get-args 0)))
             ;; message-string doesn't get set until here because `format'
             ;; will complain if its first argument isn't a string
             (setq message-string (apply 'format (ad-get-args 0)))
             (member message-string
                     message-suppression-these))
        ;; we won't call `message', but we might echo to *Messages*
        (and message-suppression-to-messages-buffer
             (progn
               (setq current-buffer (current-buffer))
               (switch-to-buffer (get-buffer-create "*Messages*"))
               (goto-char (point-max))
               (insert (make-string 1 10))
               (insert message-string)
               (switch-to-buffer current-buffer)))
      ad-do-it)))

(ad-activate 'message)

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors
        (message "The world is about to end")
        (sleep-for 2)
        (/ 10 0)                        ; divide by zero signals an error
        (message "This will never evaluate")
        (sleep-for 2)
        (setq some-var 5)))
  (message "Here are the unwind forms that will always evaluate")
  (sleep-for 2)
  (setq some-var 10)
  (setq another-var "puppies")
  (message "All done!"))

(defvar init-error nil 
  "The error which happened.")

(condition-case the-error
    (progn
      ;; Do the dangerous stuff here.
      (require 'what-I-want))
  (error
   ;; This is only evaluated if there's an error.
   (setq init-error the-error)))

;;; Do the safe stuff here.


(provide 'setup-message-suppression)

