
(setq custom-file "~/emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/emacs.d/lisp")
(add-to-list 'load-path "~/emacs.d/org/lisp")

(load "~/emacs.d/my/general.el")
(load "~/emacs.d/my/colors.el")
(load "~/emacs.d/lisp/markdown.el")
(load "~/emacs.d/lisp/coffee-mode.el")
;(eval-after-load "coffee-mode" '
;  (setq-default coffee-tab-width 2)
;)

; (load "~/emacs.d/my/perl.el")
; (setq cperl-indent-wrt-brace nil)
(setq cperl-indent-parens-as-block t)

(load "~/emacs.d/my/new-nvb.el")
; Find better key for this
(global-set-key (kbd "<f11>") 'find-tag-other-window)

(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(load "~/emacs.d/lisp/tt-mode.el")

; (load "~/emacs.d/my/myerlang.el")
; (load "~/emacs.d/lisp/haskell.el")
; (load "~/emacs.d/lisp/perlysense.el")
; (load "slime.el")

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))
;(add-to-list 'auto-mode-alist '("\\.coffee$" .coffee-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(put 'narrow-to-region 'disabled nil)


;; This is a work in progress
(require 'org-install)
(require 'org-mobile)
;; Set to the location of your Org files on your local system
(setq org-directory "~/Org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Org/index.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
