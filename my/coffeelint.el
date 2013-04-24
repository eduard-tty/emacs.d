(defconst twh-mobile-root "~/projects/2dh/TWH-Mobile" "Absolute TWH mobile root.")
(defconst node-bin-path "~/projects/2dh/node/bin" "Absolute path to node bin directory.")

(defun twh-mobile-coffeelint () "Run coffeelint on all TWH mobile .coffee files in a separate process asynchronously with output going to the buffer '*twh-mobile-coffeelint*'."
  (interactive)
  (require 'compile)
  (let ((compilation-buffer-name-function (lambda (mode) "*twh-mobile-coffeelint*"))
        (compilation-error-regexp-alist (list (cons "^\\(.*?\\),\\([1-9][0-9]*\\),\\(?:error\\|\\(warn\\)\\)," '(1 2 nil (nil . 3)))))
        (compilation-scroll-output 'first-error))
    (compile (format "cd %s && PATH=%s:$PATH coffeelint --csv -f config/coffeelint.json -r ." twh-mobile-root node-bin-path))
  )
)
