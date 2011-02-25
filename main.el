(setq custom-file "~/emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/emacs.d/lisp")
(add-to-list 'load-path "~/emacs.d/my")
(add-to-list 'load-path "~/emacs.d/org/lisp")

(load "general.el")
(load "colors.el")
(load "markdown.el")
; (load "haskell.el")
; (load "perlysense.el")
(load "nvb.el")

(require 'linum)
(global-linum-mode 1)               ; line numbers everywhere

(add-hook 'org-mode-hook 'turn-on-font-lock)

(require 'org-install)
(require 'org-mobile)
;; Set to the location of your Org files on your local system
(setq org-directory "~/Org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Org/index.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
