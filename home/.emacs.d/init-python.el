(require 'python-mode)
(setq py-install-directory "~/.emacs.d/modes/python-mode.el-6.0.11")
(setq py-shell-name "ipython2")

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-codeassist-maxfixes 3) ;; stops from erroring if there's a syntax err
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("argparse" "bisect" "calendar" "collections" "ConfigParser" "datetime" "distutils" "errno" "exceptions" "fileinput" "fnmatch" "formatter" "fractions" "functools" "getopt" "glob" "hashlib" "heapq" "io" "itertools" "json" "logging" "math" "mimetypes" "os" "os.path" "pickle" "pickletools" "pipes" "platform" "pprint" "pydoc" "pyqcy" "random" "re" "repr" "setuptools" "shutil" "string" "sys" "tempfile" "time" "timeit" "urllib" "urllib2" "urlparse" "uuid" "weakref"))
(setq ropemacs-separate-doc-buffer nil)
;(setq ropemacs-confirm-saving nil)

;; flymake for python
(when (load "flymake" t)
  (require 'flymake-cursor)
  (defun flymake-pychecker-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakespep8.py" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pychecker-init))
  ;; Disable the "buffer has running process"" confirmation
  ;; when the process is a flymake process
  (defadvice flymake-start-syntax-check-process
    (after
     cheeso-advice-flymake-start-syntax-check-1
     (cmd args dir)
     activate compile)
    ;; set flag to allow exit without query on any
    ;; active flymake processes
    (set-process-query-on-exit-flag ad-return-value nil)))


;; pylookup: https://github.com/tsgates/pylookup
;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "~/.emacs.d/modes/pylookup")
(add-to-list 'load-path pylookup-dir)
;; load pylookup when compile time
(eval-when-compile (require 'pylookup))
;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))
;; set search option if you want
(setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))
;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)


;; ropemacs integration with auto-completion
(defun ac-ropemacs-candidates ()
  (mapcar (lambda (completion)
	    (concat ac-prefix completion))
	  (rope-completions)))

(ac-define-source nropemacs
  '((candidates . ac-ropemacs-candidates)
    ;(document   . py-documentation)
    (symbol     . "r") ; rope
    ))

(ac-define-source nropemacs-dot
  '((candidates . ac-ropemacs-candidates)
    ;(document   . py-documentation)
    (symbol     . "r") ; rope
    (prefix     . c-dot)
    (requires   . 0)))


(add-hook 'python-mode-hook
	  (lambda ()

	    (define-key python-mode-map (kbd "s-q") 'ace-jump-mode)
	    (define-key python-mode-map (kbd "s-h") 'py-newline-and-indent)

	    (define-key python-mode-map (kbd "s-w") 'py-electric-backspace)
	    (define-key python-mode-map (kbd "s-d") 'py-electric-delete)

	    (define-key python-mode-map (kbd "C-s-w") 'py-hungry-delete-backwards)
	    (define-key python-mode-map (kbd "C-s-d") 'py-hungry-delete-forward)

	    (define-key python-mode-map (kbd "<backtab>") 'py-dedent)

	    (define-key python-mode-map (kbd "M-s-i") 'py-previous-block-or-clause)
	    (define-key python-mode-map (kbd "M-s-k") 'py-down-block-or-clause)


	    ;; fill-column-indicator
	    ;(setq fill-column 80)
	    ;(setq fci-rule-color "gray6")
	    ;(fci-mode 1)

	    ;; automatically open a rope project if there is one
	    ;; in the current or in the upper level directory
	    (cond ((file-exists-p ".ropeproject")
		   (rope-open-project default-directory))
		  ((file-exists-p "../.ropeproject")
		   (rope-open-project (concat default-directory ".."))))

	    (rope-generate-autoimport-cache)

	    ;; enable eldoc-mode
	    ;(eldoc-mode)
	    (turn-on-eldoc-mode)
	    (set (make-local-variable 'eldoc-documentation-function) 'rope-get-calltip)

	    ;; enable flymake
	    (flymake-mode t)
 	    ;(setq flymake-cursor-error-display-delay 0.0)

	    ;; rope keybindings
	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
	    ;(define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)

	    ;; pylookup keybindings
	    (define-key python-mode-map "\C-c\C-d" 'pylookup-lookup)

	    ;; rebind the yasnippet trigger key
	    ;; it's already binded
	    ;(setq yas/trigger-key (kbd "C-c <kp-multiply>"))

	    ;; auto-complete
	    (setq ac-delay 0.1)
	    (setq ac-auto-start 4)
	    ;(setq popup-use-optimized-column-computation nil)
	    ;; enable ropemacs completions
	    ;(add-to-list 'ac-sources 'ac-source-ropemacs)
	    ;(add-to-list 'ac-sources 'ac-source-filename)
	    ;(add-to-list 'ac-sources 'ac-source-yasnippet)
	    (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)

	    (add-to-list 'ac-sources 'ac-source-nropemacs)
	    (add-to-list 'ac-sources 'ac-source-nropemacs-dot)
	    ))
