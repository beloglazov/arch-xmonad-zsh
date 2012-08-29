(add-to-list 'load-path "~/.emacs.d")
;Add all modes to the load path
(progn (cd "~/.emacs.d/modes")
       (normal-top-level-add-subdirs-to-load-path))

;; Color theme
;(load-theme 'solarized-dark t)
;(require 'zenburn-theme)
(load-theme 'deeper-blue)


;; auto-complete: https://github.com/m2ym/auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/modes/auto-complete/dict")
(ac-config-default)
(setq ac-delay 0)
(setq ac-quick-help-delay 0)
(setq ac-use-fuzzy t)
;(setq popup-use-optimized-column-computation nil)
(define-key ac-mode-map (kbd "C-<SPC>") 'auto-complete)


;; yasnippet: https://github.com/capitaomorte/yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/modes/yasnippet/snippets"
			 "~/.emacs.d/snippets"))
;(global-unset-key (kbd "M-`"))
;(global-set-key (kbd "C-`") 'yas-expand)
;(setq yas-trigger-key (kbd "C-`"))
;(setq yas-trigger-key "C-`")
(yas-global-mode 1)
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
;(setq yas/trigger-key (kbd "C-c <kp-multiply>"))


;; w3m browser
(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url)

;; ido
(require 'ido-ubiquitous)
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-flex-matching t)

;; ace-jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "s-a") 'ace-jump-mode)


;; python
(load-file "~/.emacs.d/init-python.el")

;; php
(require 'php-mode)

;; magit
(require 'magit)
(setq magit-commit-all-when-nothing-staged t)
;; magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "gray6"))))


;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; the old M-x.

;; autopair
(electric-pair-mode)

;(require 'autopair)
;(autopair-global-mode)

;; fill-column-indicator
(require 'fill-column-indicator)

;; uniquify
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; elisp
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq markdown-command "pandoc")
(setq markdown-enable-math t)
(add-hook 'markdown-mode-hook
	  (lambda ()

	    (setq fill-column 100)

	    (turn-on-auto-fill)
	    (outline-minor-mode)
	    (flyspell-mode)

	    ;; A way of delaying processes of flyspell-mode disables auto completion.
	    ;; This is a workaround for the problem.
	    (ac-flyspell-workaround)

	    (local-set-key (kbd "C-M-<left>") 'outline-backward-same-level)
	    (local-set-key (kbd "C-M-<right>") 'outline-forward-same-level)
	    (local-set-key (kbd "C-M-<up>") 'outline-previous-visible-heading)
	    (local-set-key (kbd "C-M-<down>") 'outline-next-visible-heading)
	    (local-set-key (kbd "C-M-j") 'outline-backward-same-level)
	    (local-set-key (kbd "C-M-l") 'outline-forward-same-level)
	    (local-set-key (kbd "C-M-i") 'outline-previous-visible-heading)
	    (local-set-key (kbd "C-M-k") 'outline-next-visible-heading)

	    (local-set-key (kbd "C-c C-p") 'markdown-preview)
	    (local-set-key (kbd "C-c C-b") 'markdown-insert-bold)
	    (local-set-key (kbd "C-c C-e") 'markdown-insert-italic)
	    (local-set-key (kbd "C-c C-q") 'markdown-insert-blockquote)
	    (local-set-key (kbd "C-c C-c C-c") 'markdown-insert-code)
	    (local-set-key (kbd "C-c C-l") 'markdown-insert-link)
	    (local-set-key (kbd "C-c 1") 'markdown-insert-header-1)
	    (local-set-key (kbd "C-c 2") 'markdown-insert-header-2)
	    (local-set-key (kbd "C-c 3") 'markdown-insert-header-3)
	    (local-set-key (kbd "C-c 4") 'markdown-insert-header-4)
	    (local-set-key (kbd "C-c 5") 'markdown-insert-header-5)
	    (local-set-key (kbd "C-c 6") 'markdown-insert-header-6)

	    (when buffer-file-name
	      (add-hook 'after-save-hook
			;'check-parens
			nil t))))

; warning, may yield wrong results in edge-cases like single double-quotes in code block.
; Use only if your files usually are balanced w/r/t double-quotes
; <http://stackoverflow.com/questions/9527593/customizing-check-parens-to-check-double-quotes>
(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))

;; move the mouse pointer to the corner when typing
(mouse-avoidance-mode)

;; before-save hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(cua-mode t)
(scroll-bar-mode -1) ;; disable scroll bar
(icomplete-mode t) ;; constantly update completions in the mini buffer
(global-linum-mode -1) ;; disable line number column
(menu-bar-mode -1) ;; disable the menu bar
(tool-bar-mode -1) ;; disable the tool bar
(show-paren-mode t) ;; highlight matching parentheses
(setq show-paren-delay 0) ;; remove the highlighting delay
(setq default-directory "~/repos/")


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
(setq inhibit-startup-screen t) ;; don't show the startup screen
(blink-cursor-mode -1) ;; disable cursor blinking

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


;; movement
(global-set-key (kbd "s-j") 'left-char)
(global-set-key (kbd "s-l") 'right-char)
(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-C-j") 'left-word)
(global-set-key (kbd "s-C-l") 'right-word)

(global-set-key (kbd "C-<prior>") 'next-buffer) ;; page up
(global-set-key (kbd "C-<next>") 'previous-buffer) ;; page down

;(global-set-key (kbd "C-f") 'isearch-forward)
;(global-set-key (kbd "C-f") 'isearch-repeat-forward)
;(global-set-key (kbd "C-S-f") 'isearch-backward)
;(global-set-key (kbd "C-S-f") 'isearch-repeat-backward)

(global-set-key (kbd "C-M-<prior>") 'isearch-ring-retreat)
(global-set-key (kbd "C-M-<next>") 'isearch-ring-advance)

(global-set-key (kbd "H-a") 'delete-forward-char)

(global-set-key (kbd "C-S-a") 'mark-whole-buffer)
;(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-w") 'kill-this-buffer)
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-d") 'kill-word)
(global-set-key (kbd "C-<delete>") 'kill-word)
(global-set-key (kbd "C-\\") 'fixup-whitespace)
(global-set-key (kbd "C-<tab>") 'other-window)

(global-set-key (kbd "C-M-1") 'kill-buffer-and-window)
(global-set-key (kbd "M-`") 'delete-window)
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

;; ispell
(global-set-key (kbd "<f11>") 'ispell-buffer)

;; magit
(global-set-key (kbd "<f12>") 'magit-status)


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
(global-set-key (kbd "C-s-i") 'scroll-down-in-place)
(global-set-key (kbd "C-s-k") 'scroll-up-in-place)


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
(global-set-key (kbd "s-M-i") 'move-text-up)
(global-set-key (kbd "s-M-k") 'move-text-down)


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
(global-set-key (kbd "C-S-d") 'djcb-duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c d")
		(lambda ()
		  (interactive)
		  (djcb-duplicate-line t)))

;; toggle comment
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)


;; backups
(setq backup-directory-alist `(("." . "~/.backups/emacs")))
(setq version-control t) ; make numbered backups
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
