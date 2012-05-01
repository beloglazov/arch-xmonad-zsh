(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-codeassist-maxfixes 3) ;; stops from erroring if there's a syntax err
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"))

;; automatically open a rope project if there is one
;; in the current or in the upper level directory
(add-hook 'python-mode-hook
	  (lambda ()
	    (cond ((file-exists-p ".ropeproject")
		   (rope-open-project default-directory))
		  ((file-exists-p "../.ropeproject")
		   (rope-open-project (concat default-directory ".."))))
	    (rope-generate-autoimport-cache)))

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
               '("\\.py\\'" flymake-pychecker-init)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (flymake-mode t)
	    (setq flymake-cursor-error-display-delay 0.0)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
	    (define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)))

;; ropemacs integration with auto-completion
(defun ac-ropemacs-candidates ()
  (mapcar (lambda (completion)
      (concat ac-prefix completion))
    (rope-completions)))

(ac-define-source nropemacs
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")))

(ac-define-source nropemacs-dot
  '((candidates . ac-ropemacs-candidates)
    (symbol     . "p")
    (prefix     . c-dot)
    (requires   . 0)))

(defun ac-nropemacs-setup ()
  (setq ac-sources (append '(ac-source-nropemacs
                             ac-source-nropemacs-dot) ac-sources)))
(defun ac-python-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(add-hook 'python-mode-hook 'ac-python-mode-setup)
(add-hook 'rope-open-project-hook 'ac-nropemacs-setup)
