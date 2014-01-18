



(if (eq system-type 'gnu/linux)
    (load "linux.el"))
(if (eq system-type 'windows-nt)
    (load "windows.el"))
(if (eq system-type 'darwin)
    (load "osx.el"))
(if (eq system-type 'cygwin)
    (load "cygwin.el"))
