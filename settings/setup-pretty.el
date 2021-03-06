(global-prettify-symbols-mode 1)

(defun js-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("function" . 9775)             ; ⨍
          ("var" . 10017)    ; →
          ("return" . 10239)    ; ➡
          ("=" . 9854)
          )))

(add-hook 'js2-mode-hook 'js-pretty-lambda)


(defun py-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("def" . 10765)  ; ⨍
          ("return" . 10145)    ; ➡ 
          )))

(add-hook 'python-mode-hook 'py-pretty-lambda)



(provide 'setup-pretty)

