(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs")

(setq erlang-root-dir "/usr/local/lib/erlang")

(load "erlang.el")

;; Distel : https://github.com/massemanet/distel

(add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)
