;;   -*- mode: lisp  -*-

(custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
)

(defvar org-gtd-dir "~/Dropbox/gtd/")
(defvar org-gtd-actions "actions.org")
(defvar org-gtd-inbox "inbox.org")

;; Alarm configuration
(setq ring-bell-function 'ignore)

;; Editor
(modify-coding-system-alist 'file "" 'utf-8)
(setq-default tab-width 4)

;; Packages list
(setq package-list '(helm))

;; Package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; configure helm package
(require 'helm-config)
(helm-mode 1)


(setf org-agenda-files (file-expand-wildcards (concat org-gtd-dir "*.org")))
(defun gtd ()
    (interactive)
    (find-file (concat org-gtd-dir org-gtd-actions)))

(global-set-key "\C-cg" 'gtd)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Org Refile
(setq org-refile-targets '((nil :maxlevel . 9)(org-agenda-files :maxlevel . 9)))

;; Org Capture
(setq org-capture-templates
    '(("t" "Todo" entry (file+headline (concat org-gtd-dir org-gtd-inbox) "Tasks")
       "* TODO %?\nAdded: %U %i\n")
      ("l" "Link" entry (file+headline (concat org-gtd-dir org-gtd-inbox) "Links")
       "* [[%x][%?]]\n")))

(setf org-log-done t)
(setf org-deadline-warning-days 14)
(setf org-agenda-include-all-todo nil)
(setf org-directory org-gtd-dir)
(setf org-adapt-indentation nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Auto sync externally changed files
(global-auto-revert-mode t)

(setf make-backup-files nil)

;; Uncomment to debug errors
;;(setq debug-on-error t)
