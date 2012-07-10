(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-codeassist-maxfixes 3) ;; stops from erroring if there's a syntax err
(setq ropemacs-guess-project t)
(setq ropemacs-enable-autoimport t)
;(setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"))
(setq ropemacs-separate-doc-buffer nil)
;(setq ropemacs-confirm-saving nil)

;; automatically open a rope project if there is one
;; in the current or in the upper level directory

;; (cond ((file-exists-p ".ropeproject")
;;        (rope-open-project default-directory))
;;       ((file-exists-p "../.ropeproject")
;;        (rope-open-project (concat default-directory ".."))))
;; (rope-generate-autoimport-cache)

;; enable eldoc-mode
(eldoc-mode)

(add-hook 'local-write-file-hooks 'delete-trailing-whitespace)
;;(add-hook 'local-write-file-hooks 'rope-organize-imports)
(add-hook 'write-file-functions (lambda ()
				  (let ((tmp-hooks write-file-functions))
				    (setq write-file-functions nil)
				    (setq ropemacs-confirm-saving nil)
				    (rope-organize-imports nil)				    
				    (setq ropemacs-confirm-saving t)
				    (setq write-file-functions tmp-hooks))))
 
;; flymake for python
;; (when (load "flymake" t)
;;   (require 'flymake-cursor)
;;   (defun flymake-pychecker-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakespep8.py" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pychecker-init)))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (flymake-mode t)
;; 	    (setq flymake-cursor-error-display-delay 0.0)))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
;; 	    (define-key python-mode-map "\C-c\C-d" 'rope-show-calltip)))

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
