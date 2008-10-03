;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Personalizacións
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-mail-address "denis@ceibes.org")
(setq user-full-name "Denís Fernández Cabrera")

(defvar slow-scroll-mode 1)

(defvar transient-mark-mode 1)

(require 'font-lock)

(global-font-lock-mode t)

(defun toggle-slow-scroll-mode (&optional arg)
  "Toggle slow scroll mode at each call of this function.
If slow-scroll-mode is 1, the cursor stays on current line after each scroll; else not."
  (interactive "P")
  (if (= slow-scroll-mode 0)
      (setq slow-scroll-mode 1)
    (setq slow-scroll-mode 0)))

(defun scroll-up-slowly (&optional arg)
  "Scroll text of current window upward ARG lines; or one line if no ARG.
This depend of slow scroll mode (keeping cursor on current line or not).
When calling from a program, supply a number as argument or nil."
  (interactive "P")
  (progn (if arg
	     (scroll-up arg)
	   (scroll-up 1))
	 (if (= slow-scroll-mode 1)
	     (next-line 1))))

(defun do_insert_time ()
  (interactive)
  (insert-string (current-time-string)))

(defun scroll-down-slowly (&optional arg)
  "Scroll text of current window downward ARG lines; or one line if no ARG.
This depend of slow scroll mode (keeping cursor on current line or not).
When calling from a program, supply a number as argument or nil."
  (interactive "P")
  (progn (if arg
	     (scroll-down arg)
	   (scroll-down 1))
	 (if (= slow-scroll-mode 1)
	     (previous-line 1))))

(set-variable 'slow-scroll-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippets do EMACS.
;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.5.6/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.5.6/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Effective EMACS
;; http://steve.yegge.googlepages.com/effective-emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;(global-set-key "\C-h" 'backward-delete-char-untabify)
;;(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
;;(global-set-key [(hyper h)] 'help-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(color-theme-selection "Taming Mr Arneson" nil (color-theme))
 '(column-number-mode t)
 '(ecb-options-version "2.32")
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(size-indication-mode t)
 '(speedbar-default-position (quote left)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(hl-line ((t (:background "#333")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hunspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "ispell"
   (progn
     (setq ispell-dictionary "galego"
           ispell-extra-args '("-a" "-i" "utf-8")
           ispell-silently-savep t
           ispell-dictionary-alist
           '((nil ; default
              "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "gl_ES_utf8" "-i"  
"utf-8") nil utf-8)
             ))))
(setq-default ispell-program-name "hunspell")

;; (defvar ispell-dictionary-alist 0)
;; (add-to-list 'ispell-dictionary-alist '("galego" \
;;  "\[\[:alpha:\]\]" "[^[:alpha:]]" "'-" nil ("-d" "gl_ES_utf8") nil utf-8))
;; (setq-default ispell-program-name "hunspell")
;; (setq ispell-dictionary "galician")


(ecb-activate)
