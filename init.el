(setq custom-file "/home/eduard/emacs-git/eduard/custom_file.el")
(load custom-file)


(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "my/")))
(require 'elpa)


;; (add-to-list 'load-path "/home/eduard/emacs-git/eduard/")
;; (load "/home/eduard/emacs-git/eduard/after_elpa_init.el")
;; (color-theme-solarized-dark)
(add-hook 'after-init-hook (lambda () (load "/home/eduard/emacs-git/eduard/after_elpa_init.el")))
