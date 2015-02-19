;;; Commentary:

;; This JavaScript editing mode supports:
;;
;;  - the full JavaScript language through version 1.8
;;  - support for most Rhino and SpiderMonkey extensions from 1.5 to 1.8
;;  - accurate syntax highlighting using a recursive-descent parser
;;  - syntax-error and strict-mode warning reporting
;;  - "bouncing" line indentation to choose among alternate indentation points
;;  - smart line-wrapping within comments (Emacs 22+) and strings
;;  - code folding:
;;    - show some or all function bodies as {...}
;;    - show some or all block comments as /*...*/
;;  - context-sensitive menu bar and popup menus
;;  - code browsing using the `imenu' package
;;  - typing helpers (e.g. inserting matching braces/parens)
;;  - many customization options
;;
;; It is only compatible with GNU Emacs versions 21 and higher (not XEmacs).
;;
;; Installation:
;;
;;  - put `js2.el' somewhere in your emacs load path
;;  - M-x byte-compile-file RET <path-to-js2.el> RET
;;    Note:  it will refuse to run unless byte-compiled
;;  - add these lines to your .emacs file:
;;    (autoload 'js2-mode "js2" nil t)
;;    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;
;; To customize how it works:
;;   M-x customize-group RET js2-mode RET
;;
;; The variable `js2-mode-version' is a date stamp.  When you upgrade
;; to a newer version, you must byte-compile the file again.
;;
;; Notes:
;;
;; This mode is different in many ways from standard Emacs language editing
;; modes, inasmuch as it attempts to be more like an IDE.  If this drives
;; you crazy, it IS possible to customize it to be more like other Emacs
;; editing modes.  Please customize the group `js2-mode' to see all of the
;; configuration options.
;;
;; Some of the functionality does not work in Emacs 21 -- upgrading to
;; Emacs 22 or higher will get you better results.  If you byte-compiled
;; js2.el with Emacs 21, you should re-compile it for Emacs 22.
;;
;; Unlike cc-engine based language modes, js2-mode's line-indentation is not
;; customizable.  It is a surprising amount of work to support customizable
;; indentation.  The current compromise is that the tab key lets you cycle among
;; various likely indentation points, similar to the behavior of python-mode.
;;
;; This mode does not yet work with "multi-mode" modes such as mmm-mode
;; and mumamo, although it could possibly be made to do so with some effort.
;; This means that js2-mode is currently only useful for editing JavaScript
;; files, and not for editing JavaScript within <script> tags or templates.
;;
;; This code is part of a larger project, in progress, to enable writing
;; Emacs customizations in JavaScript.
;;
;; Please email bug reports and suggestions to the author, or submit them
;; at http://code.google.com/p/js2-mode/issues

;; TODO:
;;  - add unreachable-code warning (error?) using the inconsistent-return analysis
;;  - labeled stmt length is now 1
;;  - "anonymous function does not always return a value" - use getter/setter name
;;  - extend js2-missing-semi-one-line-override to handle catch (e) {return x}
;;  - set a text prop on autoinserted delimiters and don't biff user-entered ones
;;  - when inserting magic curlies, look for matching close-curly before inserting
;;  - get more use out of the symbol table:
;;    - jump to declaration (put hyperlinks on all non-decl var usages?)
;;    - rename variable/function
;;    - warn on unused var
;;  - add some dabbrev-expansions for built-in keywords like finally, function
;;  - add at least some completion support, e.g. for built-ins
;;  - code formatting

