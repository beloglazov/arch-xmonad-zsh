(add-to-list 'load-path "~/.emacs.d/modes/python-mode.el-6.0.10")
(require 'python-mode)
(setq py-install-directory "~/.emacs.d/modes/python-mode.el-6.0.10")
(setq py-shell-name "ipython2")

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-codeassist-maxfixes 3) ;; stops from erroring if there's a syntax err
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
;(setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"))
(setq ropemacs-separate-doc-buffer nil)
;(setq ropemacs-confirm-saving nil)

;; flymake for python
(add-to-list 'load-path "~/.emacs.d/flymake-cursor")
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
               '("\\.py\\'" flymake-pychecker-init)))


;; pylookup: https://github.com/tsgates/pylookup
;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "~/.emacs.d/pylookup")
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


;; auto-complete integration with yasnippet and rope

;; (defun prefix-list-elements (list prefix)
;;   (let (value)
;;     (nreverse
;;      (dolist (element list value)
;;        (setq value (cons (format "%s%s" prefix element) value))))))

;; (defvar ac-source-rope
;;   '((candidates
;;      . (lambda ()
;;          (prefix-list-elements (rope-completions) ac-target))))
;;   "Source for Rope")

;; (defun ac-python-find ()
;;   "Python `ac-find-function'."
;;   (require 'thingatpt)
;;   (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;;     (if (null symbol)
;;         (if (string= "." (buffer-substring (- (point) 1) (point)))
;;             (point)
;;           nil)
;;       symbol)))

;; (defun ac-python-candidate ()
;;   "Python `ac-candidates-function'"
;;   (let (candidates)
;;     (dolist (source ac-sources)
;;       (if (symbolp source)
;;           (setq source (symbol-value source)))
;;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;;              (requires (cdr-safe (assq 'requires source)))
;;              cand)
;;         (if (or (null requires)
;;                 (>= (length ac-target) requires))
;;             (setq cand
;;                   (delq nil
;;                         (mapcar (lambda (candidate)
;;                                   (propertize candidate 'source source))
;;                                 (funcall (cdr (assq 'candidates source)))))))
;;         (if (and (> ac-limit 1)
;;                  (> (length cand) ac-limit))
;;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;;         (setq candidates (append candidates cand))))
;;     (delete-dups candidates)))

;;Ryan's python specific tab completion
;; Try the following:
;; 1) Do a yasnippet expansion
;; 2) Do a Rope code completion
;; 3) Do an indent
;; (defun ryan-python-tab ()
;;   (interactive)
;;   (if (eql (ac-start) 0)
;;       (indent-for-tab-command)))

;; (defadvice ac-start (before advice-turn-on-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) t))

;; (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) nil))


(add-hook 'python-mode-hook
	  (lambda ()

	    ;; automatically open a rope project if there is one
	    ;; in the current or in the upper level directory
	    (cond ((file-exists-p ".ropeproject")
		   (rope-open-project default-directory))
		  ((file-exists-p "../.ropeproject")
		   (rope-open-project (concat default-directory ".."))))

	    (rope-generate-autoimport-cache)

	    ;; enable eldoc-mode
	    (eldoc-mode)

	    ;; enable flymake
	    (flymake-mode t)
 	    (setq flymake-cursor-error-display-delay 0.0)

	    ;; rope keybindings
	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
	    ;(define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)

	    ;; pylookup keybindings
	    (define-key python-mode-map "\C-c\C-d" 'pylookup-lookup)

	    ;; rebind the yasnippet trigger key
	    (setq yas/trigger-key (kbd "C-c <kp-multiply>"))

	    ;; auto-complete
	    ;; (auto-complete-mode 1)
	    ;; (set (make-local-variable 'ac-sources)
	    ;; 	 (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
	    ;; (set (make-local-variable 'ac-find-function) 'ac-python-find)
	    ;; (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
	    ;; (set (make-local-variable 'ac-auto-start) nil)

	    ;; (define-key python-mode-map "\t" 'ryan-python-tab)

	    ))



;;(add-hook 'local-write-file-hooks 'rope-organize-imports)
;; (add-hook 'write-file-functions (lambda ()
;; 				  (let ((tmp-hooks write-file-functions))
;; 				    (setq write-file-functions nil)
;; 				    (setq ropemacs-confirm-saving nil)
;; 				    (rope-organize-imports nil)
;; 				    (setq ropemacs-confirm-saving t)
;; 				    (setq write-file-functions tmp-hooks))))


;; ;; ropemacs integration with auto-completion
;; (defun ac-ropemacs-candidates ()
;;   (mapcar (lambda (completion)
;;       (concat ac-prefix completion))
;;     (rope-completions)))

;; (ac-define-source nropemacs
;;   '((candidates . ac-ropemacs-candidates)
;;     (document   . ac-symbol-documentation)
;;     (symbol     . "p")))

;; (ac-define-source nropemacs-dot
;;   '((candidates . ac-ropemacs-candidates)
;;     (document   . ac-symbol-documentation)
;;     (symbol     . "p")
;;     (prefix     . c-dot)
;;     (requires   . 0)))

;; (defun ac-nropemacs-setup ()
;;   (setq ac-sources (append '(ac-source-nropemacs
;;                              ac-source-nropemacs-dot) ac-sources)))
;; (defun ac-python-mode-setup ()
;;   (add-to-list 'ac-sources 'ac-source-yasnippet))

;; ;(add-hook 'python-mode-hook 'ac-python-mode-setup)
;; (add-hook 'python-mode-hook 'ac-nropemacs-setup)
;; ;(add-hook 'rope-open-project-hook 'ac-nropemacs-setup)
