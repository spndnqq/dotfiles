;; Disable Startup Screen
(setq inhibit-startup-screen t)

;; Disable Menubar & Toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Display Line Numbers In Every Buffer
(global-display-line-numbers-mode 1)

;; Stop Creating Backup Files
(setq make-backup-files nil)

;; MELPA Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Straight Extension
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Theme  
(straight-use-package 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

;; Font
(set-frame-font "Cascadia Code 10" nil t)