(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(if (eq system-type 'gnu/linux)
    (load "linux.el"))
(if (eq system-type 'windows-nt)
    (load "windows.el"))
(if (eq system-type 'darwin)
    (load "osx.el"))
(if (eq system-type 'cygwin)
    (load "cygwin.el"))


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

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(column-number-mode t)

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)
(add-hook 'ido-setup-hook 
	  (lambda () 
	    (define-key ido-completion-map [tab] 'ido-complete)))

;; (require 'backup-each-save)
;; (add-hook 'after-save-hook 'backup-each-save)
;; (defun backup-each-save-filter (filename)
;;   (let ((ignored-filenames
;; 	 '("^/tmp" "semantic.cache$" "\\.emacs-places$"
;; 	   "\\.recentf$" ".newsrc\\(\\.eld\\)?"))
;; 	(matched-ignored-filename nil))
;;     (mapc
;;      (lambda (x)
;;        (when (string-match x filename)
;; 	 (setq matched-ignored-filename t)))
;;      ignored-filenames)
;;     (not matched-ignored-filename)))
;; (setq backup-each-save-filter-function 'backup-each-save-filter)

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let*
      ((col (current-column))
       (start (progn
		(beginning-of-line)
		(point)))
       (end (progn
	      (end-of-line)
	      (forward-char)
	      (point))))
       (let ((line-text (delete-and-extract-region start end)))
	 (forward-line n)
	 (insert line-text)
    ;; restore point to original column in moved line
	 (forward-line -1)
	 (forward-char col))))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(require 'calendar)
(setq calendar-week-start-day 1)
(calendar-set-date-style 'european)
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;; Diary customizations
(setq calendar-view-diary-initially-flag t)
(setq calendar-mark-diary-entries-flag t)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)


(fset 'yes-or-no-p 'y-or-n-p)

;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-clarity)

(setq x-select-enable-clipboard t)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; file ending conversion
(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix t))

(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))

(defun mac-file ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))

(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
    (goto-char (point-min))
    (while (search-forward (string ?\C-m) nil t)
      (replace-match "" nil t))))

;;git
;; (require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;; (require 'git)
;; (autoload 'git-blame-mode "git-blame"
;;   "Minor mode for incremental blame for Git." t)
;; (require 'magit)

;; (defun mt ()
;;   (interactive)
;;   (magit-status default-directory))
;; (global-set-key (kbd "<f12>") 'mt)

(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))


(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(autoload 'gid "id-utils" nil t)

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)
(add-hook 'ido-setup-hook 
	  (lambda () 
	    (define-key ido-completion-map [tab] 'ido-complete)))


(prefer-coding-system 'utf-8)
;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(menu-bar-mode t)
;;(enable-theme 'solarized-dark)
 
;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)
 
;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)              
 
(set-cursor-color "red")
 
(setq default-frame-alist
      '((cursor-color . "red")))
 
;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)
 
(global-visual-line-mode 1)
 
(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
 
;;(scroll-bar-mode nil)
 
;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)
 
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f5] 'indent-region)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-l" 'end-of-line)
 
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xt" 'select-frame-by-name)
 
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
 
(global-set-key "\C-xy" 'revert-buffer)
 
;; Disable backups
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)
 
;;some custom functions, stolen for internet
(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1)))) 
(defun geosoft-backward-word ()
 ;; Move one word backward. Leave the pointer at start of word
 ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word))
        (t (forward-char 1)))) 
 
(global-set-key [C-right] 'geosoft-forward-word)
(global-set-key [C-left] 'geosoft-backward-word)
 
 
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers
 
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
 
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
 
;; Ctags path set in the system specific file 
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
  )
 
(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)
 
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
 
 
(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory dotfiles-dir 0))
 
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
 
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun colorize-compilation-buffer ()
  (interactive)
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
 
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
