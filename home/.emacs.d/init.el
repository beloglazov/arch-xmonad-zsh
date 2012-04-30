(add-to-list 'load-path "~/.emacs.d/")
(load (expand-file-name "~/.emacs.d/elpa/package.el"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;(setq skeleton-pair nil) ; disable the custom pairing

(load-file "~/.emacs.d/init-python.el")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; zenburn
(require 'zenburn-theme)

;; ido
(ido-ubiquitous-mode t)

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; the old M-x.

;; autopair
(require 'autopair)
(autopair-global-mode)

;; uniquify
(require 'uniquify)
(setq 
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; elisp
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)


(cua-mode t)
(scroll-bar-mode -1) ;; disable scroll bar
(icomplete-mode t) ;; constantly update completions in the mini buffer
(global-linum-mode -1) ;; disable line number column
(menu-bar-mode -1) ;; disable the menu bar
(tool-bar-mode -1) ;; disable the tool bar
(show-paren-mode t) ;; highlight matching parentheses


(set-face-attribute 'default nil
	:weight 'normal 
	:height 120 
	:width 'normal 
	:family "Terminus (TTF)")

(setq vc-follow-symlinks t)
(setq bookmark-save-flag 1)
(setq scroll-margin 2)
(setq tab-width 4)
(setq undo-limit 1000000)
(setq undo-strong-limit 2000000)
(setq split-window-keep-point t)
(setq mouse-yank-at-point t) ;; don't move the point when pasting with the mouse
(setq x-select-enable-clipboard t) ;; using clipboard by default
(setq sentence-end-double-space nil)
(setq imenu-auto-rescan t) ;; auto-updating the index of M-x imenu
(setq doc-view-continuous t) ;; continuous scrolling in pdfs


;; ibuffer grouping
(setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("dired" (mode . dired-mode))
                   ("perl" (mode . cperl-mode))
                   ("erc" (mode . erc-mode))
                   ("planner" (or
                               (name . "^\\*Calendar\\*$")
                               (name . "^diary$")
                               (mode . muse-mode)))
                   ("emacs" (or
                             (name . "^\\*scratch\\*$")
                             (name . "^\\*Messages\\*$")))
                   ("gnus" (or
                            (mode . message-mode)
                            (mode . bbdb-mode)
                            (mode . mail-mode)
                            (mode . gnus-group-mode)
                            (mode . gnus-summary-mode)
                            (mode . gnus-article-mode)
                            (name . "^\\.bbdb$")
                            (name . "^\\.newsrc-dribble")))))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))


;; key bindings

(defun set-local-newline-and-indent ()
  (local-set-key (kbd "<return>") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-local-newline-and-indent)
(add-hook 'emacs-lisp-mode-hook 'set-local-newline-and-indent)
(add-hook 'javascript-mode-hook 'set-local-newline-and-indent)


(global-set-key (kbd "C-<prior>") 'next-buffer) ;; page up
(global-set-key (kbd "C-<next>") 'previous-buffer) ;; page down

;(global-set-key (kbd "C-f") 'isearch-forward)
;(global-set-key (kbd "C-f") 'isearch-repeat-forward)
;(global-set-key (kbd "C-S-f") 'isearch-backward)
;(global-set-key (kbd "C-S-f") 'isearch-repeat-backward)

(global-set-key (kbd "C-M-<prior>") 'isearch-ring-retreat)
(global-set-key (kbd "C-M-<next>") 'isearch-ring-advance)

(global-set-key (kbd "H-a") 'delete-forward-char)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-<delete>") 'kill-word)
(global-set-key (kbd "C-\\") 'fixup-whitespace)
(global-set-key (kbd "C-<tab>") 'other-window)

(global-set-key (kbd "C-M-1") 'kill-buffer-and-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-horizontally)
(global-set-key (kbd "M-3") 'split-window-vertically)

;; search
(global-set-key (kbd "<f1>") 'isearch-forward)
(global-set-key (kbd "<f2>") 'isearch-backward)

(add-hook 'isearch-mode-hook 
	  (lambda ()
	    (define-key isearch-mode-map (kbd "<f1>") 'isearch-repeat-forward)
	    (define-key isearch-mode-map (kbd "<f2>") 'isearch-repeat-backward)))

;; registers
(global-set-key (kbd "M-<f5>") 'point-to-register)
(global-set-key (kbd "<f5>") 'jump-to-register)
(global-set-key (kbd "M-<f6>") 'bookmark-set)
(global-set-key (kbd "<f6>") 'bookmark-jump)
(global-set-key (kbd "M-<f7>") 'copy-to-register)
(global-set-key (kbd "<f7>") 'insert-register)

;; flymake errors
(global-set-key (kbd "<f8>") 'flymake-goto-next-error)
(global-set-key (kbd "<f9>") 'flymake-goto-prev-error)


;; scroll in-place

(defun scroll-down-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))

(defun scroll-up-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))

(global-set-key [C-up] 'scroll-down-in-place)
(global-set-key [C-down] 'scroll-up-in-place)


;; smart home

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work 
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(put 'smart-beginning-of-line 'CUA 'move)
(global-set-key [home] 'smart-beginning-of-line)



;; backups

; return a backup file path of a give file path
; with full directory mirroring from a root dir
; non-existant dir will be created
(defun my-backup-file-name (fPath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let (backup-root bpath)
    (setq backup-root "~/.backups/emacs")
    (setq bpath (concat backup-root fPath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath
  )
)
(setq make-backup-file-name-function 'my-backup-file-name)
(setq version-control t) ; make numbered backups
(setq backup-by-copying t)
