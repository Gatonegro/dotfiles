
;; Yasnippets do EMACS.

(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.5.6/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.5.6/")


;; http://steve.yegge.googlepages.com/effective-emacs

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;(global-set-key "\C-h" 'backward-delete-char-untabify)
;;(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
;;(global-set-key [(hyper h)] 'help-command)


;; Hunspell: pra correxir co tradutor do OOo.
;; segundo: http://thenybble.de//blog//blog/hunspell-emacs/
;; Flyspell/ispell settings
;; Use hunspell instead of ispell
(setq ispell-program-name "hunspell")
(add-to-list 'ispell-dictionary-alist '("gl_ES_utf8" \
"\[\[:alpha:\]\]" "[^[:alpha:]]" "'-" nil ("-d" "gl_ES_utf8") nil utf-8))
;; set the default dictionary to something *great*.
(setq ispell-dictionary "gl_ES_utf8")
