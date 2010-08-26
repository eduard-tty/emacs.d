(defun highlight-error ()
  (other-window 1)
  (when (string-match "^\\*.*\\*$" (format "%s" (current-buffer)))
    (hl-line-mode t)
  )
  (other-window 1)
)

(defun first-error-select () "Visit first 'next-error' message and corresponding source code; highlight the current error."
  (interactive)
  (first-error)
  (highlight-error)
)

(defun next-error-select () "Visit next 'next-error' message and corresponding source code; highlight the current error."
  (interactive)
  (next-error)
  (highlight-error)
)

(defun previous-error-select () "Visit previous 'next-error' message and corresponding source code; highlight the current error."
  (interactive)
  (previous-error)
  (highlight-error)
)

(global-set-key (kbd "<f8>") 'next-error-select)
(global-set-key (kbd "C-<f8>") 'first-error-select)
(global-set-key (kbd "S-<f8>") 'previous-error-select)

; (define-key viper-vi-intercept-map "e" 'next-error-select)

(defconst nvb-root "/home/eduard/projects/nvb/NVB/")

(defun nvb-grep (pattern) "Grep (case-sensitive)."
  (interactive "sEnter grep pattern: ")
  (compile (concat "cd " nvb-root "bin/ && . ../export_env && ./grep-nvb '" pattern "'"))
)

(defun nvb-igrep (pattern) "Grep (case-insensitive)."
  (interactive "sEnter grep pattern: ")
    (compile (concat "cd " nvb-root "bin/ && . ../export_env && ./grep-nvb -i '" pattern "'"))
)

(defun nvb-test (arguments) "Run test(s)."
  (interactive "sEnter prove arguments: ")
  (let ((compilation-buffer-name-function (lambda (mode) "*test*")))
    (compile (concat "cd " nvb-root "t/ && . ../export_env && prove " arguments))
  )
)

(defun nvb-tidy-and-statler-modified () "Run tidy_and_statler_modified."
  (interactive)
  (let ((compilation-buffer-name-function (lambda (mode) "*tidy-and-statler-modified*")))
    (compile (concat "cd " nvb-root " && . ./export_env && ./tidy_and_statler_modified"))
  )
)

(add-hook 'compilation-finish-functions '
  (lambda (buffer string)
    (when (string-equal (format "%s" buffer) "*tidy-and-statler-modified*")
      (revert-all-buffers)
    )
  )
)

; ##############################################################################
(defconst nvb-subdir-module "Lib/")                    ; relative to nvb-root
(defconst nvb-subdir-test "Test/")                     ;  relative to nvb-subdir-module
(defconst nvb-subdir-controller "NVB/Controller/")     ; relative to nvb-subdir-module
(defconst nvb-subdir-template "Templates/Controller/") ; relative to nvb-root

(defun nvb-switch-subdir-controller-template (nvb-subdir)
  (let ((case-fold-search nil) (is-controller nil) (is-template nil))
    (if (string-match (concat "^" nvb-subdir-template) nvb-subdir)
      (setq is-template t)
      (if (string-match (concat "^" nvb-subdir-module nvb-subdir-test nvb-subdir-controller) nvb-subdir)
        (setq is-controller t)
        (if (string-match (concat "^" nvb-subdir-module nvb-subdir-controller) nvb-subdir)
          (setq is-controller t)
        )
      )
    )
    (when (or is-controller is-template)
      (let ((basedir nil) (subdir (replace-match "" t t nvb-subdir)))
        (when (string-match "^[A-Z]\\w*/" subdir)
          (setq basedir (match-string 0 subdir))
          (setq subdir (replace-match "" t t subdir))
        )
        (if is-controller
          (progn
            (when (and (string-equal "Component/" basedir) (string-match "^Link/Stylesheet/" subdir))
              (setq basedir "URI/css/")
              (setq subdir (replace-match "" t t subdir))
            )
            (when (and (string-equal "Component/" basedir) (string-match "^Link/Javascript/" subdir))
              (setq basedir "URI/javascript/")
              (setq subdir (replace-match "" t t subdir))
            )
            (while (string-match "\\(\\w\\)\\([A-Z]\\)" subdir)
              (setq subdir (replace-match (concat (match-string 1 subdir) "-" (match-string 2 subdir)) t t subdir))
            )
            (concat nvb-subdir-template basedir (substring (downcase subdir) 0 -2) "tt")
          )
          (progn
            (when (and (string-equal "URI/" basedir) (string-match "^css/" subdir))
              (setq basedir "Component/Link/Stylesheet/")
              (setq subdir (replace-match "" t t subdir))
            )
            (when (and (string-equal "URI/" basedir) (string-match "^javascript/" subdir))
              (setq basedir "Component/Link/Javascript/")
              (setq subdir (replace-match "" t t subdir))
            )
            (while (string-match "\\(/\\|^\\)\\([a-z]\\)" subdir)
              (setq subdir (replace-match (concat (match-string 1 subdir) (upcase (match-string 2 subdir))) t t subdir))
            )
            (while (string-match "\\(\\w\\)-\\(\\w\\)" subdir)
              (setq subdir (replace-match (concat (match-string 1 subdir) (upcase (match-string 2 subdir))) t t subdir))
            )
            (concat nvb-subdir-module nvb-subdir-controller basedir (substring subdir 0 -2) "pm")
          )
        )
      )
    )
  )
)

(defun nvb-switch-subdir-module-test (nvb-subdir)
  (let ((case-fold-search nil))
    (when (string-match (concat "^" nvb-subdir-module) nvb-subdir)
      (let ((basedir nil) (subdir (replace-match "" t t nvb-subdir)))
        (if (string-match (concat "^" nvb-subdir-test) subdir)
          (setq subdir (replace-match "" t t subdir))
          (setq basedir nvb-subdir-test)
        )
        (concat nvb-subdir-module basedir subdir)
      )
    )
  )
)

(defun nvb-switch (do-other-window do-module-test do-controller-template)
  (let ((case-fold-search nil) (path buffer-file-name))
    (when (string-match (concat "^" nvb-root) path)
      (let ((nvb-subdir (replace-match "" t t path)) (subdir nil))
        (when (and do-controller-template (not subdir))
          (setq subdir (nvb-switch-subdir-controller-template nvb-subdir))
        )
        (when (and do-module-test (not subdir))
          (setq subdir (nvb-switch-subdir-module-test nvb-subdir))
        )
        (when subdir
          (if do-other-window
            (find-file-other-window (concat nvb-root subdir))
            (find-file (concat nvb-root subdir))
          )
        )
      )
    )
  )
)

(defun nvb-switch-file () "Switch nvb file."
  (interactive)
  (nvb-switch nil t t)
)

(defun nvb-switch-file-other-window () "Switch nvb file, in another window."
  (interactive)
  (nvb-switch t t t)
)

(defun nvb-switch-controller-template () "Switch nvb controller and template."
  (interactive)
  (nvb-switch nil nil t)
)

(defun nvb-switch-controller-template-other-window () "Switch nvb controller and template, in another window."
  (interactive)
  (nvb-switch t nil t)
)

(defun nvb-switch-module-test () "Switch nvb module and test."
  (interactive)
  (nvb-switch nil t nil)
)

(defun nvb-switch-module-test-other-window () "Switch nvb module and test, in another window."
  (interactive)
  (nvb-switch t t nil)
)


(global-set-key "\C-cg" 'nvb-grep)
(global-set-key "\C-cG" 'nvb-igrep)
(global-set-key "\C-cs" 'nvb-tidy-and-statler-modified)
(global-set-key "\C-c\C-s" 'nvb-tidy-and-statler-modified)
(global-set-key "\C-ct" 'nvb-test)
(global-set-key "\C-cw" 'nvb-switch-file)
(global-set-key "\C-cW" 'nvb-switch-file-other-window)
(global-set-key "\C-c\C-w" 'nvb-switch-file-other-window)

(global-set-key (kbd "<f6>") 'nvb-switch-module-test)
(global-set-key (kbd "C-<f6>") 'nvb-switch-module-test-other-window)
(global-set-key (kbd "M-<f6>") 'nvb-switch-controller-template-other-window)
(global-set-key (kbd "S-<f6>") 'nvb-switch-controller-template)

;(global-set-key (kbd "M-<f7>") 'mason-mode)
