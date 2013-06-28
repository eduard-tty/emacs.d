(set-default-font '"-unknown-Inconsolata-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

;; use package manager instead
;; https://github.com/sellout/emacs-color-theme-solarized.git
(setq load-path
      (cons "/home/eduard/emacs-git/emacs-color-theme-solarized/" load-path))
(require 'color-theme-solarized)
(color-theme-solarized-light)

(require 'linum)
(global-linum-mode 1)                       ; line numbers everywhere

(provide 'appearance)
