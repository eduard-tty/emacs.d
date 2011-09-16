(global-font-lock-mode 1)
(setq-default indent-tabs-mode nil)         ; spaces when indenting code
(fset 'yes-or-no-p 'y-or-n-p)               ; replace y-e-s by y
(setq inhibit-startup-message t)            ; no splash

(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

(tool-bar-mode -1)
(menu-bar-mode 1)
; (set-scroll-bar-mode 'right)            
(set-scroll-bar-mode nil)                   ; to resize with whole bar
(setq scroll-step 1)                        ; scroll one line when moving past top or bottom
(setq visible-bell t)

(require 'linum)
(global-linum-mode 1)                       ; line numbers everywhere




; user defined functions

(defun revert-all-buffers () "Replace text of all open buffers with the text of the corresponding visited file on disk."
  (interactive)
  (when (y-or-n-p "Revert all buffers? ")
    (let* ((list (buffer-list)) (buffer (car list)))
      (while buffer
        (when (buffer-file-name buffer)
          (set-buffer buffer)
          (revert-buffer t t t)
        )
        (setq list (cdr list))
        (setq buffer (car list))
      )
    )
  )
)


(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-x\M-b" 'list-buffers)
