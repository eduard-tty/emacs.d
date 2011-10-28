(defconst nvb-root "/home/eduard/projects/nvb/NVB/")
(let ((nvb-dir "Misc/emacs/"))
  (if 
    (file-exists-p (concat nvb-root nvb-dir "nvb-init.el" ) )
    (progn
      (add-to-list 'load-path (concat nvb-root nvb-dir ) )
      (load "nvb-init.el" )
      )
    )
)

(global-set-key (kbd "<f9>" ) 'ediff-trees-examine-next)
(setq ediff-split-window-function 'split-window-horizontally)
