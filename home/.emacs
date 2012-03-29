;;(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/ecb-snap/")
;;(add-to-list 'load-path "~/.emacs.d/cedet-1.0.1/")
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

;;(require 'ido)
;;(ido-mode t)
;;(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;;(load-file "~/.emacs.d/cedet-1.1beta2/common/cedet.el")
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

(require 'ecb)
(require 'color-theme)
(require 'zenburn)
(zenburn)
(set-scroll-bar-mode 'right)

(icomplete-mode t) ;; constantly updating completions in the mini buffer
(global-linum-mode 0) ;; disable line number column

;;(and ;; need to replace this with scrolling with arrows while holding C-S
;; (require 'centered-cursor-mode)
;; (global-centered-cursor-mode +1))

(set-face-attribute 'default nil
	:weight 'normal 
	:height 120 
	:width 'normal 
	:family "Terminus (TTF)")

(setq vc-follow-symlinks t)
(setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))
(setq bookmark-save-flag 1)
(setq scroll-margin 2)

	
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(diredp-ignored-file-name ((t (:foreground "#bebebe"))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:background "black" :foreground "white"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(ecb-options-version "2.40")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(put 'set-goal-column 'disabled nil)


;; Key bindings

(global-set-key (kbd "C-<prior>") 'next-buffer) ;; page up
(global-set-key (kbd "C-<next>") 'previous-buffer) ;; page down

(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'isearch-backward)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-<delete>") 'kill-word)

(global-set-key (kbd "C-<tab>") 'other-window)

(global-set-key (kbd "M-1") 'delete-other-windows)


(defun scroll-down-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))

(defun scroll-up-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))

;;(global-set-key [mouse-4] 'scroll-down-in-place)
;;(global-set-key [mouse-5] 'scroll-up-in-place)
(global-set-key [C-up] 'scroll-down-in-place)
(global-set-key [C-down] 'scroll-up-in-place)