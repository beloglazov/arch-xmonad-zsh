(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(load (expand-file-name "~/.emacs.d/elpa/package.el"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(setq ac-dwim t)
(setq ac-delay 0)
(setq ac-quick-help-delay 0)
(ac-config-default)
(define-key ac-mode-map (kbd "C-<SPC>") 'auto-complete)

;; python
(load-file "~/.emacs.d/init-python.el")

;; Zenburn
;(require 'color-theme)
;(setq color-theme-load-all-themes nil)
;(require 'color-theme-tangotango)

;(require 'zenburn-theme)
(load-theme 'deeper-blue)

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
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
(global-set-key (kbd "C-x C-b") 'ibuffer)

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
(global-set-key (kbd "M-<f6>") 'copy-to-register)
(global-set-key (kbd "<f6>") 'insert-register)
(global-set-key (kbd "M-<f7>") 'bookmark-set)
(global-set-key (kbd "<f7>") 'bookmark-jump)

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


;; move text
;; https://github.com/gabrielelanaro/emacs-for-python/blob/master/epy-editing.el

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)


;; duplicate line
;; https://github.com/gabrielelanaro/emacs-for-python/blob/master/epy-editing.el

(defun djcb-duplicate-line (&optional commentfirst)
  "comment line at point; if COMMENTFIRST is non-nil, comment the original"
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
      (comment-region (region-beginning) (region-end)))
    (insert-string
     (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))

;; duplicate a line
(global-set-key (kbd "C-d") 'djcb-duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c c")
		(lambda ()
		  (interactive)
		  (djcb-duplicate-line t)))


;; backups
(setq backup-directory-alist `(("." . "~/.backups/emacs")))
(setq version-control t) ; make numbered backups
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
