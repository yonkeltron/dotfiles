;; ;; Optionally, specify the lisp program you are using. Default is "lisp"
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;;;stop splash screen
(setq inhibit-startup-message t)

;;; tetris
(setq tetris-score-file "~/.emacs.d/tetris-scores")

;;;; Browsing
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;;;;maybe this will give me a good way to get a bash shell in a new buffer
(defun bash () "Opens a new buffer called *bash* with /bin/bash running in an ansi-term"
  (interactive) (ansi-term "/bin/bash" "bash"))

(defun zsh () "Opens a new buffer called *zsh* with /bin/bash running in an ansi-term"
  (interactive) (ansi-term "/usr/bin/zsh" "zsh"))


(ansi-color-for-comint-mode-on)

;;;;make auto-fill-mode come on with latex-mode
(add-hook 'latex-mode-hook 'turn-on-auto-fill t)

;; rakefile + gemfile editing
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; puppet mode
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;;;; rhtml and erb editing

(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)
;;(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
;;(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

;;;; jst editing
(add-to-list 'auto-mode-alist '("\\.jst.ejs$" . html-mode))

;;;; scss
(add-to-list 'auto-mode-alist '("\.scss$" . css-mode))

;;; zsh script editing
(add-to-list 'auto-mode-alist '("\.zsh$" . sh-mode))

;;; IRC via rcirc
;; (load "~/.emacs.d/rcirc-config.el")

;;;; gnus
(load "~/.gnus")

;;;; flymake
;;(load "~/.emacs.d/flymakerc.el")

;;;; org-mode
;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-auto-fill t)
(setq org-agenda-files (list "~/notes/todo.org"))
(setq org-log-done 'time)

;;;; printing
(require 'printing)
(pr-update-menus t)

;;;; customize crap goes in another file and not this one. yay!
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;; aspell
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'org-mode-hook
    (lambda ()
      (flyspell-mode 1)))
(add-hook 'latex-mode-hook
    (lambda ()
      (flyspell-mode 1)))


;; linum numbe spacing hack
(setq linum-format "%d ")

;; TABS
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)

;; magit
(setq magit-commit-signoff t)

(setq-default indicate-empty-lines t)
(setq-default show-trailing-whitespace t)

;;; solarized
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(load-theme 'solarized-light)
;;(require 'color-theme-solarized)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
