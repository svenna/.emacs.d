(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("SC" . "http://joseito.republika.pl/sunrise-commander/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))

(add-hook 'after-init-hook (lambda () (load "after-package-init.el")))

;; (defvar cerfirm/packages '(ac-js2
;;                            adaptive-wrap
;;                            ag
;;                            auto-complete
;;                            calfw
;;                            cask
;;                            color-theme-sanityinc-tomorrow
;;                            dash
;;                            drag-stuff
;;                            ecb
;;                            enclose
;;                            findr
;;                            floobits
;;                            git-commit-mode
;;                            git-rebase-mode
;;                            highlight
;;                            idle-highlight
;;                            inf-ruby
;;                            js2-mode
;;                            magit
;;                            maxframe
;;                            mew
;;                            multi-term
;;                            noctilux-theme
;;                            pallet
;;                            pkg-info
;;                            popup
;;                            project-explorer
;;                            projectile
;;                            rainbow-delimiters
;;                            rainbow-mode
;;                            recentf-ext
;;                            rubocop
;;                            ruby-compilation
;;                            ruby-tools
;;                            s
;;                            simple-httpd
;;                            skewer-mode
;;                            soft-morning-theme
;;                            sr-speedbar
;;                            tabbar
;;                            w3m
;;                            web-mode
;;                            wrap-region)
;;   "Default packages")

;; (defun cerfirm/packages-installed-p ()
;;   (loop for pkg in cerfirm/packages
;;         when (not (package-installed-p pkg)) do (return nil)
;;         finally (return t)))

;; (unless (cerfirm/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg cerfirm/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))
