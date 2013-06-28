(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-by-copying nil)
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(ps-font-size (quote (9 . 9)))
 '(ps-header-font-size (quote (8 . 10)))
 '(ps-header-title-font-size (quote (10 . 12)))
 '(ps-left-footer (quote (ps-get-buffer-name)))
 '(ps-line-number t)
 '(ps-line-number-start 1)
 '(ps-line-number-step 1)
 '(ps-lpr-command "xpp")
 '(ps-print-header-frame nil)
 '(scroll-bar-mode nil)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 )

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "my/")))
(require 'elpa)


;; (add-to-list 'load-path "/home/eduard/emacs-git/eduard/")
;; (load "/home/eduard/emacs-git/eduard/after_elpa_init.el")
;; (color-theme-solarized-dark)
(add-hook 'after-init-hook (lambda () (load "/home/eduard/emacs-git/eduard/after_elpa_init.el")))
