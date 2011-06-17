(setq custom-file "~/emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/emacs.d/lisp")
(add-to-list 'load-path "~/emacs.d/org/lisp")

(load "~/emacs.d/my/general.el")
(load "~/emacs.d/my/colors.el")
(load "~/emacs.d/lisp/markdown.el")
(load "~/emacs.d/my/nvb.el")
(load "~/emacs.d/my/myerlang.el")

; (load "~/emacs.d/lisp/haskell.el")
; (load "~/emacs.d/lisp/perlysense.el")
; (load "slime.el")

(add-hook 'org-mode-hook 'turn-on-font-lock)


;; This is a work in progress
(require 'org-install)
(require 'org-mobile)
;; Set to the location of your Org files on your local system
(setq org-directory "~/Org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Org/index.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
