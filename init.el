(defun concatenate-dirs (dirlist)
  (if (> (length dirlist) 1)
      (concat (file-name-as-directory (car dirlist)) (concatenate-dirs (cdr dirlist)))
    (car dirlist)))

(message ".emacs loading ...")
(defconst jof-load-time-start (float-time))

(defvar home-dir (file-name-as-directory "~"))

(defvar emacs-dir (file-name-as-directory (concatenate-dirs (cons home-dir '(".emacs.d")))))
(defvar jof-emacs-dir (file-name-as-directory (concatenate-dirs (cons home-dir '(".emacs.d" "jof")))))

(setenv "PATH" (concat "C:/tools/bin;c:/tools/gnuwin32/bin;" (getenv "PATH")))

(defun dotemacs ()
  (interactive)
  (find-file (concat home-dir "emacs.d/init.el")))


(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


;; (if (boundp 'server-process)
;;     (if server-process nil
;;       (server-start))
;;   (server-start))

;; (labels ((add-path (p)
;; 		   (add-to-list 'load-path
;; 				(concat emacs-root p))))
;; Add all directories below main dir
;; control the actual recursion with the subdir.el files
;; and the .nosearch files
;; (progn (cd jof-emacs-dir) (normal-top-level-add-subdirs-to-load-path)) 


(add-to-list 'load-path jof-emacs-dir)
(load "00package-setup")
(load "01common-setup.el")
(load "02ruby.el")
(load "03python.el")
(load "04c.el")
(load "05org.el")

