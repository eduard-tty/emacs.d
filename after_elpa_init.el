(setq-default truncate-partial-width-windows nil)

(which-function-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Viper mode stuff
(setq viper-mode t)
(require 'viper)

(setq compilation-scroll-output t)
;(require 'inf-haskell)

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; remember mode
(org-remember-insinuate)
(setq org-directory "~/Dropbox/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; yasnippet
(require 'yasnippet)

(setq next-error-highlight 5)

(put 'upcase-region 'disabled nil)

(defun load-twh ()
  "Load the twh environment"
  (interactive)
  (require 'twh)
  )

;; use package for this
;(setq load-path
;      (cons "/home/marius/git/tt-mode/" load-path))
;(autoload 'tt-mode "tt-mode")
;(setq auto-mode-alist
;      (append '(("\\.tt$" . tt-mode))  auto-mode-alist ))

(put 'narrow-to-region 'disabled nil)
(setq inhibit-startup-message t)

(require 'navigation)
(require 'appearance)
(require 'perl)
(require 'misc)
(require 'keymap)
(require 'ox-reveal)
