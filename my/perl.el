
(defun perl-sub-list () "Display links to all sub's in a buffer."
  (interactive)
  (list-matching-lines "^[[:blank:]]*sub[[:blank:]]")
)


(defun my-perl-mode-hook () "Things I want only when in perl mode"
    (define-key perl-mode-map (kbd "S-<f3>") 'perl-sub-list)
)

(add-hook 'perl-mode-hook 'my-perl-mode-hook)
(add-hook 'cperl-mode-hook 'my-perl-mode-hook)
(set 'cperl-indent-level 4)

