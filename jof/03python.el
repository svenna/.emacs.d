(setenv "PYMACS_PYTHON" "python2.6")

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  ;; (setenv "PYTHONPATH" (concat (getenv "PYTHONPATH")
  ;; 			       ":" (expand-file-name "~/projects/pymacs")))
  (setq pymacs-load-path (list (concat jof-emacs-dir "pymacs/rope")
			       (concat jof-emacs-dir "pymacs/ropemode")
			       (concat jof-emacs-dir "pymacs/ropemacs")))
;  (load "~/projects/pymacs/pymacs.el")
  (setenv "PYMACS_PYTHON" "python26")
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")

  ;; ropemacs variables
  (setq ropemacs-confirm-saving 'nil)
  (setq ropemacs-enable-autoimport 't)
  (setq ropemacs-autoimport-modules '("os" "shutil"))
  (setq ropemacs-autoimport-underlineds 't)

  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t)
  (eval-after-load "pymacs"
    '(add-to-list 'pymacs-load-path (concat jof-emacs-dir "pymacs/jof")))
  (eval-after-load "pymacs"
    '(add-to-list 'pymacs-load-path (concat jof-emacs-dir "elisp/python-mode")))

  )
;;(load-ropemacs)
(global-set-key "\C-xpl" 'load-ropemacs) 

(load-library "pylint")
(require 'python-mode)
(require 'ipython)
(setq py-python-command-args '( "-colors" "Linux" "-deep_reload" "-gthread"))


(defun pyf ()
  "Run pyflakes over buffer"
  (interactive)
  (compile (concat "pyflakes " (basename (buffer-name)) ".py")))

