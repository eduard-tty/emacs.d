(global-font-lock-mode 1)
(setq indent-tabs-mode nil)         ; spaces when indenting code
(fset 'yes-or-no-p 'y-or-n-p)       ; replace y-e-s by y
(setq inhibit-startup-message t)    ; no splash

(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

(tool-bar-mode -1)
(set-scroll-bar-mode 'right)   
(setq scroll-step 1)                ; scroll one line when moving past top or bottom
(setq visible-bell t)

