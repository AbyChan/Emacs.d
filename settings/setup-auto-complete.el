(require 'auto-complete-config)
(require 'auto-complete)

 (let ((dictionaries-dir (expand-file-name "dictionaries"
                                            user-emacs-directory)))
    (make-directory dictionaries-dir t)
    (setq ispell-local-dictionary "en_US")
    (setq ispell-local-dictionary-alist '((nil
                                           "[[:alpha:]]"
                                           "[^[:alpha:]]"
                                           "[']"
                                           nil
                                           ("-d" "en_US"
                                            "-p" dictionaries-dir)
                                           nil
                                           utf-8)
                                          ("en_US"
                                           "[[:alpha:]]"
                                           "[^[:alpha:]]"
                                           "[']"
                                           nil
                                           ("-d" "en_US"
                                            "-p" dictionaries-dir)
                                           nil
                                           utf-8)
                                          ("german"
                                           "[[:alpha:]]"
                                           "[^[:alpha:]]"
                                           "[']"
                                           t
                                           ("-d" "de_DE_frami"
                                            "-p" dictionaries-dir)
                                           "~tex"
                                           utf-8)
                                          ("russian"
                                           "[[:alpha:]]"
                                           "[^[:alpha:]]"
                                           "[']"
                                           nil
                                           ("-d" "ru_RU"
                                            "-p" dictionaries-dir)
                                           nil
                                           utf-8))))

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)

(setq ac-auto-start 1)

(setq ac-ignore-case nil)

;;(require 'auto-dictionary)

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js3-mode))
(add-to-list 'interpreter-mode-alist '("node" . sass-mode))

(add-hook 'js3-mode-hook 'auto-complete-mode)

(provide 'setup-auto-complete)

