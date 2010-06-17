(setq custom-file "~/emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/emacs.d/lisp")
(add-to-list 'load-path "~/emacs.d/my")

(load "general.el")
(load "colors.el")
(load "markdown.el")
; (load "haskell.el")
; (load "perlysense.el")

(require 'linum)
(global-linum-mode 1)               ; line numbers everywhere

(add-hook 'org-mode-hook 'turn-on-font-lock)
