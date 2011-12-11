(require 'color-theme)
(require 'zenburn)
(zenburn)
(set-scroll-bar-mode 'right)
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "/usr/share/emacs/23.3/lisp/net/tramp.elc")
(load-file "~/.emacs.d/ergoemacs_1.9.3.1/site-lisp/site-start.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diredp-date-time ((((type tty)) :foreground "yellow") (t :foreground "#F0DFAF")))
 '(diredp-dir-heading ((((type tty)) :background "yellow" :foreground "blue") (t :background "#41363C" :foreground "#ECBCBC")))
 '(diredp-dir-priv ((t (:background "#3F3F3F" :foreground "thistle"))))
 '(diredp-display-msg ((((type tty)) :foreground "blue") (t :foreground "#93B3A3")))
 '(diredp-file-name ((t (:foreground "#8CD0D3"))))
 '(diredp-file-suffix ((t (:foreground "#7F9F7F"))))
 '(diredp-flag-mark-line ((t (:background "#9FAFAF"))))
 '(diredp-ignored-file-name ((t (:foreground "#80D4AA"))))
 '(diredp-number ((t (:foreground "#8F8F8F"))))
 '(diredp-symlink ((t (:foreground "#F0DFAF"))))
 '(slime-repl-inputed-output-face ((t :background "#41363C" :foreground "#ECBCBC"))))
