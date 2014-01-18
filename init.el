(defun concatenate-dirs (dirlist)
  (if (> (length dirlist) 1)
      (concat (file-name-as-directory (car dirlist)) (concatenate-dirs (cdr dirlist)))
    (car dirlist)))

(message ".emacs loading ...")
(defconst jof-load-time-start (float-time))

(defvar home-dir (file-name-as-directory "~"))

(defvar emacs-dir (file-name-as-directory (concatenate-dirs (cons home-dir '(".emacs.d")))))
(defvar jof-emacs-dir (file-name-as-directory (concatenate-dirs (cons home-dir '(".emacs.d" "jof")))))
(defvar vendor-dir (file-name-as-directory (concatenate-dirs (cons emacs-dir '("lisp")))))

(setenv "PATH" (concat "C:/tools/bin;c:/tools/gnuwin32/bin;" (getenv "PATH")))

(defun dotemacs ()
  (interactive)
  (find-file (concat emacs-dir "init.el")))

(add-to-list 'load-path jof-emacs-dir)
(add-to-list 'load-path jof-emacs-dir)

(load "00package-setup")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
