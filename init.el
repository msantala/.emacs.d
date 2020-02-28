;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(flycheck
    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    flycheck-clj-kondo
    ido-completing-read+
    smex
    projectile
    rainbow-delimiters
    tagedit
    magit
    ace-window
    ag
    all-the-icons
    company
    company-box
    company-lsp
    company-quickhelp
    dashboard
    eldoc-box ;; check
    eyebrowse
    ;;helm
    ;;helm-cider
    lsp-mode
    lsp-ui
    neotree
    smart-mode-line
    tagedit
    tide
    which-key
    yaml-mode
    yasnippet ;; check
    yasnippet-snippets ;; check
    gruvbox-theme))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Customizations
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "dashboard.el")
(load "misc.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-elisp.el")
(load "setup-lsp.el")
(load "setup-ts.el")

;; Environment variables for REPL etc.
(load "env.el")




