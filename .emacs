;;  .emacs --- cs61a class master emacs startup file

;;  Copyright (C) 1998 Regents of California

;;  Author: Unknown
;;  Last modified: 10/02/01
;;  History:
;;  2001-10-02: auto-save-interval:100->1000 (David Schultz)
;;  2004-08-25: added options for 'master' on Linux or MacOSX (mars@cs)

;; Commentary:
;;
;; This is based on the ~cs61a/adm/class.emacs file (Aug 25, 2004).
;; It sets meta-S to load STk in a buffer within emacs.
;;
;; It is modified for users who install emacs and the EECS STk at
;; home (on Linux or MacOSX) from the EECS InstCD.  Note that the
;; current version of STk for Windows cannot start within emacs,
;; so this file will not enable meta-S on Windows.
;;
;; There are 2 things you may need to change for your own situation:
;;
;; 1. The base path to STk is defined by the 'master' constant.  
;;    Here are the typical choices.  It is set here for Linux:

;;(defconst master "/usr/local")     	   ;; for Linux
;;(defconst master "/Applications/STk")	      ;; for macOSX
(defconst stkhome "/usr/local/bin/stk-simply")

;; 2. Tell emacs what program you would like it to use.  The INSTCD
;;    gives 3 options.  It is set here to 'stk'.   Your shell PATH
;;    environment variable must include the directory where this is
;;    installed.

(setq scheme-program-name "/usr/local/bin/stk-simply")		;;# loads nothing
;;(setq scheme-program-name "stk-explorin")			# explorin.scm is dominant
;;(setq scheme-program-name "stk-simply")			# simply.scm is dominant

;;; Path

(setq load-path
      (append (mapcar 'expand-file-name
                      (list  
		      	            (concat stkhome "/lib/emacs/lisp")))
				          nil		; MUST BE LAST IN LIST
              load-path))
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Set Info directory back to the right thing.

(require 'info)

(setq Info-default-directory-list 
      (append (mapcar 'expand-file-name
      	            (list (concat stkhome "/lib/emacs/info")))
		          Info-default-directory-list))

(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
;;#############################################################################
;;***** Beginning of general customization

;;; completions package
;;(load "completion.el")
;;(initialize-completions)

;; Controlling backup files:
;;
;; Set the following variable to `nil' to disable the making of backup
;; files.

(setq make-backup-files t)


;; The following variables control how backup files are made, and are
;; only used if `make-backup-files' is non-nil.
;;
;; Backup files are created when a file is saved for the first time (and
;; the file already exists on disk).  Backup files can be created by
;; renaming the original file or by copying.
;;
;; Renaming means that Emacs renames the existing file so that it is a
;; backup file, then writes the buffer into a new file.  Any other names
;; that the old file had will now refer to the backup file.  The new
;; file is owned by you and its group is defaulted.  Note that this
;; method CAN CHANGE the ownerships of a file.  The variables
;; `backup-by-copying-when-linked' and `backup-by-copying-when-mismatch'
;; control whether or not the ownerships can change.
;;
; Copying means that Emacs copies the existing file into the backup
;; file, then writes the buffer on top of the existing file.  Any other
;; names that the old file had will now refer to the new (edited) file.
;; The file's owner and group are unchanged.  However, if you edit very
;; large file, backing up by copying can take a long time.
;;
;; The choice of renaming or copying is controlled by the variables
;; backup-by-copying, backup-by-copying-when-linked and
;; backup-by-copying-when-mismatch.  For most people, these variables
;; should have the following values:
;;
;;	backup-by-copying			nil
;;	backup-by-copying-when-linked			t
;;	backup-by-copying-when-mismatch				t
;;
;; If you want to backup by renaming, set the variable
;; `backup-by-copying' to nil; if you want to backup by copying, set the
;; variable `backup-by-copying' to non-nil.

(setq backup-by-copying nil)

;; If you want to use copying to create backups for files with multiple
;; names, set `backup-by-copying-when-linked' to non-nil.  This causes
;; the alternate names to refer to the latest version as edited.  This
;; variable is relevant only if backup-by-copying is nil.

(setq backup-by-copying-when-linked t)

;; If you want to create backups by copying if this preserves owner or
;; group, set `backup-by-copying-when-mismatch' to non-nil.  Renaming
;; may still be used (subject to control of other variables) when it
;; would not result in changing the owner or group of the file; that is,
;; for files which are owned by you and whose group matches the default
;; for a new file created there by you.  This variable is relevant only
;; if backup-by-copying is nil.

(setq backup-by-copying-when-mismatch t)


;; You can set `require-final-newline' to one of the following to
;; control newlines at the end of a file when the file is saved:
;;
;;	t		Silently place a newline at the end of the file
;;				 when the file is saved.  This is done only if
;;				      	  the file does not already end with a newline.
;;					  nil 	   Don't add newlines.
;;					  (anything else) Ask the user what to do.

(setq require-final-newline t)


;; Set the following to `t' to create numbered backup files.  Set it to
;; `nil' to make numbered backup files only for those files that already
;; have them.  Set it to `never' to never make numbered backup files
;; (i.e., use "(setq version-control 'never)").

(setq version-control nil)


;; Set the following variable to `t' or `nil', depending on whether or
;; not you want Emacs to auto-save your files.  It is strongly suggested
;; that auto-save-default be set to `t' (enable auto-save) to prevent
;; much work from being lost in the event of a power failure or system
;; crash.

(setq auto-save-default nil)


;; auto-save-interval is the number of keystrokes between auto-saves.
;; If it is set to zero, autosaving is disabled.

(setq auto-save-interval 1000)


;; If default-truncate-lines is non-nil, continuation lines are not
;; displayed; each line of text is given one and only one screen line.
;; In this case, lines longer than the screen/window width have to be
;; viewed using the scroll-left and scroll-right functions.
;; It is recommended that default-truncate-lines be set to `nil'.

(setq default-truncate-lines nil)
(setq truncate-partial-width-windows default-truncate-lines)


;; scroll-step is the number of lines to try scrolling a window when
;; point tries to move outside of a window.  If that fails to bring the
;; point back onto the screen the point is centered in the window
;; instead.  If scroll-step is zero, the point is always centered after
;; it moves outside of a window.

(setq scroll-step 0)


;; next-screen-context lines contains the number of lines of continuity
;; when scrolling a window.

(setq next-screen-context-lines 1)

;;**** Key-binding changes

(global-set-key "\eg" 'goto-line)   
(global-set-key "\eW" 'copy-region-as-kill) 
;; (global-set-key "\^w" 'backward-kill-word)
;; (global-set-key "\eq" 'query-replace)
;; (global-set-key "\eQ" 'query-replace-regexp)
;; (global-set-key "\^x\^e" 'compile)
;; (global-set-key [S-return] 'newline-and-indent)

;; Disable C-x n n, ^z, C-x C-l, C-x C-u

(global-unset-key "\^z")
(global-unset-key "\^xnn")
;; (global-unset-key "\^x\^l")
;; (global-unset-key "\^x\^u")


(if (and (eq window-system 'x) (eq emacs-major-version 20))
 (progn
  (load "faces")
  (setq hilit-mode-enable-list '())
  (require 'paren)
  (require 'faces)

;;  (set-background-color "moccasin")
;;  (set-foreground-color "black")
;;  (set-cursor-color "orange")
;;  (set-face-background 'region "SandyBrown")
;;  (make-face 'paren-match-face)
;;  (set-face-foreground 'paren-match-face "black")
;;  (set-face-background 'paren-match-face "chocolate")
;;  (setq show-paren-face 'paren-match-face)
))

;; Make .h and .H files default to C++ mode rather than C mode.
(setq auto-mode-alist
  (append 
   '(("\\.H$" . c++-mode)
     ("\\.h$" . c++-mode))
   auto-mode-alist))


;; Set up C/C++ indentation
(setq c-tab-always-indent 'nil)
(setq c-indent-level 4)
;;(define-key c-mode-map "\r" 'newline-and-indent)
(setq c-continued-statement-offset 4)
(setq c-argdecl-indent 0)

(load "cmuscheme")

(defun run-stk () "
   Remove the *scheme* buffer unless it is running Stk.  If there is no
   *scheme* buffer running Stk, create one.  Switch to the *scheme* buffer."
   (interactive)
   (set-buffer (get-buffer-create "*scheme*"))
   (let ((proc (get-buffer-process "*scheme*")))
     (if (and proc (not (string-match 
     	       "stk$" (car (process-command proc)))))
	        (progn 
		   (set-process-buffer proc nil)
		      (kill-process proc))))
   (run-scheme))

(defun run-half-scheme () "
   Run Scheme in half a window."
   (interactive)
   (split-window-vertically nil)
   (other-window 1)
   (call-interactively 'run-scheme))


;; Additional local key and menu definitions in Scheme mode.

(define-key scheme-mode-map [menu-bar scheme]
  (cons "Scheme" (make-sparse-keymap "Scheme")))

(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-load-file-and-go] '("Send Scheme File & Go" . scheme-load-file-and-go))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-load-file] '("Send Scheme File" . scheme-load-file))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-send-region-and-go] '("Send Region & Go". scheme-send-region-and-go))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-send-region] '("Send Region" . scheme-send-region))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-send-defn-and-go]
  '("Send Definition & Go" . scheme-send-definition-and-go))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-send-defn] '("Send Definition" . scheme-send-definition))
(define-key (lookup-key scheme-mode-map [menu-bar scheme])
  [scheme-indent-sexp] '("Indent S-expression" . scheme-indent-sexp))
(setq menu-bar-final-items (cons 'scheme menu-bar-final-items))


(define-key scheme-mode-map "\C-c\M-l" 'scheme-load-file-and-go)
(define-key scheme-mode-map "\r" 'newline-and-indent)

(defun scheme-load-file-and-go (file-name)
  "Load Scheme file FILE-NAME into the inferior Scheme process and then 
go to Scheme buffer."
  (interactive (comint-get-source "Load Scheme file: " scheme-prev-l/c-dir/file
  	       			  	  scheme-source-modes t)) ; T because LOAD 
                                                          ; needs an exact name
  (scheme-load-file file-name)
  (switch-to-scheme t))

(add-hook 'scheme-mode-hook
	    (function
	       (lambda ()
	            (setq comment-start ";; "))))

(defun scheme-send-enclosing-definition () "
  Send the definition containing point to the *scheme* process."
  (interactive)
  (forward-char 7)
  (search-backward-regexp "^(define")
  (forward-sexp)
  (scheme-send-last-sexp)
  (if (not (null (search-forward "(define" nil t)))
    (backward-char 7)))

(global-set-key "\M-p"          'scheme-send-enclosing-definition)
(global-set-key "\M-s"          'run-half-scheme)
(define-key esc-map "\C-q"	'scheme-indent-sexp)

; stkdb debugger (PNH 8/20/2003)
;(require 'stkdb)


;; if you use special syntax, you can tell it what you want indented

(put 'sequence 'scheme-indent-function 0)
(put 'define-method 'scheme-indent-function 1)
(put 'slot-ref 'scheme-indent-function 0)

;; Marking regions

;; (setq transient-mark-mode t)

;; Line numbers

(line-number-mode 1)

;; Printing

(load "lpr")

(defun print-buffer ()
  "Print buffer contents as with Unix command `lpr -p'.
`lpr-switches' is a list of extra switches (strings) to pass to lpr."
  (interactive)
  (print-region-1 (point-min) (point-max) 
  		    (append lpr-switches (lpr-make-buffer-title)) t))

(defun lpr-make-buffer-title ()
  (list (concat "-b" (user-login-name) ":" (buffer-name) "<Emacs-buffer>")))

(setq lpr-command "enscript-stdin")

; Set lpr-headers-switches rather than lpr-switches to get 
; around an odd bug in print-region-1.
(setq lpr-headers-switches "-2rG")

;; Set degree of noviceness

;; Don't complain about ESC ESC,  [commented out b/c emacs tutorial says so!]
;; (put 'eval-expression 'disabled nil)

(defvar abbreviated-buffer-file-name nil
   "A shortened version of the buffer's file name, if any (buffer local).")

(make-variable-buffer-local 'abbreviated-buffer-file-name)

(setq find-file-hooks 
      (append find-file-hooks '(set-abbreviated-file-name)))
(setq write-file-hooks 
      (append write-file-hooks '(set-abbreviated-file-name)))

(defun set-abbreviated-file-name ()
  (let* ((name (abbreviate-file-name buffer-file-name))
   (suffix-index (string-match "\\(/[^/]*/[^/]*/[^/]*\\)$" name)))
    (setq abbreviated-buffer-file-name
      (if (and suffix-index (> suffix-index 3))
            (concat "..." (substring name suffix-index))
	        name))
    nil))

(setq-default mode-line-format
  '("EMACS {" host-name ": " mode-line-buffer-identification
    "%1*%1+" (line-number-mode " L%l") "}   "
    "%[(" mode-name minor-mode-alist "%n" mode-line-process
    ")%]   "
    (buffer-file-name ("{ " abbreviated-buffer-file-name " }   "))
    (-3 . "%p") "   " global-mode-string))

(set-default (quote mode-line-buffer-identification) (quote ("%b")))

;; Initial windows: Reminder file (if any) and Scheme.

; (shell)
; (call-interactively 'run-scheme)
; (split-window-vertically nil)
; (other-window 1)
; (switch-to-buffer "*shell*")
; (other-window 1)



(raise-frame (car (car (cdr (current-frame-configuration)))))

;; (if (eq window-system 'x)
;;     (let ((remfile (substitute-in-file-name "~$MASTER/adm/reminder"))
;;       frame-window)
;;       (if (file-readable-p remfile)
;; 	   (progn
;; 	       (save-window-excursion
;; 	             (find-file remfile)
;; 		           (let ((frame (make-frame '((minibuffer . nil) 
;; 			   			    		   (height . 50)
;;											 (width . 80)
;;														 (name . "Class Notices. (Click here to put in the background.)")))))
;; 														       (raise-frame frame)
;; 														       		    (setq frame-window (frame-selected-window frame))))
;; 																        (set-buffer "reminder")
;; 																	    (goto-char (point-max))
;; 																	        (beginning-of-line (- 3 (window-height frame-window)))
;; 																		    (set-window-start frame-window (point))
;; 																		        (set-buffer-modified-p nil)
;; 																			    (toggle-read-only 1)))))
																			          
																				      
;; this stuff is to use (ding) Gnus as the newsreader.

(setq gnus-default-nntp-server "agate.berkeley.edu")

(setq gnus-default-subscribed-newsgroups 
      '("ucb.class.cs61a" "news.announce.newusers"
      "news.groups.questions" "gnu.emacs.gnus"))

;; (if (eq window-system 'x)
;;     (progn
;;       (set-face-font
;;        'italic "-adobe-courier-medium-o-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'modeline "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'default "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'bold-italic "-adobe-courier-bold-o-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'bold "-adobe-courier-bold-r-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'highlight "-adobe-courier-bold-r-normal--18-180-75-75-m-110-iso8859-1")
;;       (set-face-font
;;        'region "-adobe-courier-bold-r-normal--18-180-75-75-m-110-iso8859-1")
;; ))

; This function overrides the function of the same name in 
; cmuscheme.el. -- brg, Aug 30 1998
;
(defun switch-to-scheme (eob-p)
  "Switch to the scheme process buffer.
   With argument, positions cursor at end of buffer."
  (interactive "P")
  (let ((buff (get-buffer scheme-buffer)))
    (if buff
    (if (not (eq buff (current-buffer)))
        (switch-to-buffer-other-window scheme-buffer))
;            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; Using this function to grab the scheme buffer instead of
; `pop-to-buffer' will prevent the currently selected window from
; ever being used to get the scheme buffer. -- brg, Aug 30 1998
;
      (error "No current process buffer. See variable scheme-buffer.")))
  (cond (eob-p
         (push-mark)
         (goto-char (point-max)))))

;; Miscellaneous adjustments

; Turn off the confounded tool bar (PNH 8/20/2003)
;(tool-bar-mode 0)

; Set readable menubar face [code copied from cus-face.el] (PNH 8/20/2003)
(require 'cus-face)
(let ((face 'menu)
      (spec '((((type x-toolkit)) (:width normal :family "Courier"))))
      (now nil)
      (comment nil))
  (put face 'saved-face spec)
  (put face 'saved-face-comment comment)
  (when now
    (put face 'force-face t))
  (when (or now (facep face))
    (put face 'face-comment comment)
    (make-empty-face face)
    (face-spec-set face spec)))

(defun set-program-coloring (arg)
  (interactive "P")
  (show-paren-mode arg)
  (global-font-lock-mode arg))


;;;######################################################################
;; Place any additional customization after the "load" command for 
;; this file.
;;;######################################################################


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default t)
 '(auto-save-visited-file-name t)
 '(custom-safe-themes
   (quote
    ("c2046750815cbebfa3605c2da5fc2299a26e178623aad4e6582dca98f504f805" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "6f62b7c431e43504b93447132fef571e617ebe8d4730de492bfe22a005ffe589" "c6f477e42c7065c2705ec4c411a4cda0d1a70d674ac743366b77e461a97a656c" "596efe0d5e6eaf96c18cfb375bf7cb357ed0051163ead59c3971681ececdce1c" "76f96559b0815630d073ffafe9bed50cde8f77df0f3434022a9a1251b36e3271" default)))
 '(debug-on-error nil)
 '(default-input-method "latin-alt-postfix")
 '(erc-disable-ctcp-replies t)
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notifications readonly ring smiley stamp track)))
 '(erc-nick "coyotespike")
 '(erc-verbose-server-ping t)
 '(exec-path
   (quote
    ("/usr/local/smlnj/bin" "/usr/local/bin" "/usr/local/bin/lein" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin")))
 '(fci-rule-color "wheat4")
 '(fci-rule-column 80)
 '(fci-rule-use-dashes t)
 '(fill-column 80)
 '(inferior-octave-program "usr/local/bin/octave")
 '(linum-eager t)
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("~/Documents/Org-Drill/IncReading.org" "~/Documents/To-Do.org")))
 '(org-agenda-include-diary t)
 '(org-agenda-todo-ignore-deadlines (quote far))
 '(org-agenda-todo-ignore-scheduled 20)
 '(org-annotate-file-add-search t)
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file "~/Documents/To-Do.org")
 '(org-drill-add-random-noise-to-intervals-p t)
 '(org-drill-adjust-intervals-for-early-and-late-repetitions-p t)
 '(org-drill-optimal-factor-matrix
   (quote
    ((4
      (2.2800000000000002 . 2.418)
      (2.7 . 2.691)
      (2.36 . 2.36)
      (1.9400000000000002 . 2.067)
      (1.9999999999999998 . 2.208)
      (2.08 . 2.142)
      (2.5 . 2.5)
      (2.6 . 2.6)
      (2.1799999999999997 . 2.291)
      (2.22 . 2.22)
      (2.04 . 2.195)
      (2.46 . 2.443)
      (2.32 . 2.374)
      (1.9000000000000001 . 2.065)
      (2.66 . 2.635)
      (2.42 . 2.457)
      (2.1399999999999997 . 2.272)
      (2.14 . 2.111)
      (2.3200000000000003 . 2.298)
      (2.52 . 2.505)
      (2.56 . 2.546)
      (2.8000000000000003 . 2.794)
      (2.2199999999999998 . 2.277))
     (3
      (2.9 . 2.898)
      (2.1799999999999997 . 2.325)
      (2.1399999999999997 . 2.322)
      (2.66 . 2.674)
      (2.42 . 2.493)
      (2.24 . 2.404)
      (2.4799999999999995 . 2.604)
      (2.38 . 2.491)
      (2.52 . 2.58)
      (2.32 . 2.409)
      (3.0 . 2.999)
      (2.2800000000000002 . 2.407)
      (2.8000000000000003 . 2.773)
      (1.56 . 2.03)
      (2.04 . 2.243)
      (2.08 . 2.142)
      (2.7 . 2.679)
      (1.9000000000000001 . 2.065)
      (2.36 . 2.412)
      (1.76 . 1.934)
      (2.6 . 2.588)
      (2.56 . 2.584)
      (2.3200000000000003 . 2.298)
      (2.46 . 2.497)
      (2.22 . 2.22)
      (1.6800000000000002 . 1.987)
      (2.2199999999999998 . 2.328))
     (2
      (2.24 . 2.403)
      (3.0 . 2.999)
      (2.32 . 2.409)
      (2.48 . 2.48)
      (2.66 . 2.674)
      (2.34 . 2.474)
      (2.38 . 2.491)
      (2.42 . 2.401)
      (2.4799999999999995 . 2.604)
      (1.8 . 1.872)
      (2.9 . 2.898)
      (2.8000000000000003 . 2.773)
      (2.1399999999999997 . 2.321)
      (2.56 . 2.584)
      (1.76 . 1.992)
      (1.9400000000000002 . 2.067)
      (2.3200000000000003 . 2.298)
      (2.2800000000000002 . 2.407)
      (1.8199999999999998 . 2.159)
      (1.96 . 2.238)
      (2.22 . 2.22)
      (1.9000000000000001 . 2.065)
      (1.6800000000000002 . 1.987)
      (2.08 . 2.142)
      (2.1799999999999997 . 2.325)
      (2.46 . 2.496)
      (2.6 . 2.588)
      (2.7 . 2.679)
      (2.5 . 2.5)
      (2.2199999999999998 . 2.328)
      (2.04 . 2.243)
      (2.36 . 2.412))
     (1
      (2.32 . 4.0)
      (2.7600000000000002 . 4.43)
      (2.66 . 4.28)
      (2.8000000000000003 . 4.435)
      (2.9 . 4.14)
      (2.56 . 4.135)
      (2.18 . 3.995)
      (2.3200000000000003 . 4.14)
      (2.7 . 4.285)
      (2.04 . 3.59)
      (2.46 . 3.995)
      (2.22 . 4.0)
      (2.08 . 3.86)
      (1.9000000000000001 . 3.72)
      (2.6 . 4.14)
      (2.2199999999999998 . 3.725)
      (2.1799999999999997 . 3.72)
      (1.96 . 3.58)
      (2.5 . 4.0)
      (2.36 . 3.86)))))
 '(org-drill-use-visible-cloze-face-p t)
 '(org-export-allow-bind-keywords t)
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-from-is-user-regexp "\\<Timothy Roy\\>")
 '(org-hide-emphasis-markers t)
 '(org-md-headline-style (quote atx))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-protocol org-rmail org-w3m org-drill org-learn org-mac-iCal org-toc org-protocol org-contacts)))
 '(org-pomodoro-finished-sound-p nil)
 '(org-pomodoro-length 45)
 '(org-pomodoro-long-break-length 15)
 '(org-pomodoro-long-break-sound-p nil)
 '(org-pomodoro-short-break-length 15)
 '(org-pomodoro-short-break-sound-p nil)
 '(org-pomodoro-sound-args nil)
 '(org-pretty-entities t)
 '(org-publish-after-export-hook (quote (ignore)))
 '(org-startup-with-inline-images t)
 '(org-startup-with-latex-preview t)
 '(org-time-stamp-custom-formats (quote ("<%m/%d/%y %a>" . "<%m/%d/%y %a [%H:%M]>")))
 '(org-trello-current-prefix-keybinding "C-c o")
 '(org-use-fast-todo-selection t)
 '(package-selected-packages
   (quote
    (indium org-pomodoro solidity-mode org-wc wc-goal-mode vagrant-tramp dracula-theme darktooth-theme use-package-chords yaml-mode org-plus-contrib god-mode wc-mode virtualenvwrapper use-package todochiku smex rainbow-mode rainbow-delimiters powerline pianobar org-alert ob-ipython neotree multi-term mc-extras magit linum-off kanban jedi helm-w3m helm-spotify hc-zenburn-theme fill-column-indicator exec-path-from-shell darkburn-theme cyberpunk-theme clojure-mode-extra-font-locking clojure-cheatsheet cljr-helm cheatsheet bonjourmadame beeminder aggressive-indent adoc-mode ace-window ace-flyspell ac-cider)))
 '(pomodoro-break-start-sound "on")
 '(pomodoro-show-number t)
 '(pomodoro-work-start-sound "on")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-5 ((t (:inherit outline-6))))
 '(org-level-6 ((t (:inherit outline-8))))
 '(org-level-8 ((t (:inherit outline-5))))
 '(org-verbatim ((t (:inherit \ \#f1fa8c\ )))))

;; My init stuff
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
	     '("marmalade" . "https://marmalade-repo.org/packages") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package linum-off)

(use-package org-plus-contrib)


(use-package use-package-chords
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1))
 ;; Max time delay between two key presses to be considered a key chord

(use-package god-mode
  :chords (("gm" . god-mode-all)))

(use-package neotree
  :init
  (progn
    ;; Every time when the neotree window is opened, it will try to find current
    ;; file and jump to node.
    (setq-default neo-smart-open t)
    ;; Do not allow neotree to be the only open window
    (setq-default neo-dont-be-alone t))
  ;; :config
  ;; (neotree-toggle)
  (progn
    (setq neo-theme 'ascii))) ; 'classic, 'nerd, 'ascii, 'arrow

;;; clojure-cheatsheet
;;; Put stuff in config if other packages depend on it.
;;; Can have :if, :when, :unless, :disabled conditional loading.
;;; Using Growl to show commands??
;;; C-c C-m is macro-expand. :disabled nils the whole thing out.

;;; What is that growler thing?
;;; company, company-fix
;;; osx-clipboard
;;; :pin to specify a particlar one.
;;; if not auto-loading globally can use :ensure to do so for particualr pacage.
;;; use :defer to delay loading so it starts up quickly.
;;; setq use-package-verbose t, shows if > 0.1 seconds.
;;; describe-personal-keybindings
;;; see screencast by John Wiegley.

;;; Support for auto-upgrading packages from Emacs? 
;;; Slime

;;; Radia goes int eh bar of a mac.



;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(use-package multi-term
  :config
  (setq multi-term-program "/bin/zsh"))

;;; https://gist.github.com/bmorphism/9e7038033aac991b11df
(add-hook 'term-mode-hook
	  (lambda () (setq truncate-lines t)))

(eval-after-load "multi-term"
  '(progn
     (add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
     (add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
     (add-to-list 'term-bind-key-alist '("M-DEL" . term-send-backward-kill-word))
     (add-to-list 'term-bind-key-alist '("M-h" . term-send-backward-kill-word))
     (add-to-list 'term-bind-key-alist '("C-h" . term-send-backspace))
     ))
;; High-contrast zenburn, for a slight change
;; (use-package hc-zenburn-theme
;;   :init
;;   (load-theme 'hc-zenburn t))

;; (use-package darkburn-theme
;;   :init
;;   (load-theme 'darkburn t))

(use-package dracula-theme
  :init
  (load-theme 'dracula t))


;; (use-package cyberpunk-theme  ;;cyberpunk-theme
;;   :init
;;   (load-theme 'cyberpunk t)) ;; cyberpunk

;; (use-package darktooth-theme
;;   :init
;;   (load-theme 'darktooth t))

;;; Powerline needs to come after hc-zenburn, otherwise the orange colors
;;; are overwritten.
(use-package powerline
  :init
  (powerline-default-theme)
  :config
  (set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange2"
                    :box nil))

(add-to-list 'default-frame-alist '(font . "Meslo LG M DZ for Powerline" ))

(setq org-agenda-files
      (append
       (file-expand-wildcards "~/Documents/Org-Drill/IncReading.org")
       (file-expand-wildcards "~/Documents/To-Do.org")))


;;; Fill-column set to 80, not 70
(setq-default fill-column 80)

;; Path to ML
;; (setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
;; (setq exec-path (cons "/usr/local/smlnj/bin" exec-path))

;; (setenv "PATH" (concat "/usr/local/bin" (getenv "PATH")))
;; (setq exec-path (cons "/usr/local/bin" exec-path))

;; Don't show the Emacs welcome screen.
(setq inhibit-splash-screen t)

;; Magic ido stuff - turning off to try helm
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t) 

;; Number all the lines
;;(global-linum-mode t)

(add-hook 'prog-mode-hook 'linum-mode)
;; Org-mode is unworkably slow at 3000 lines. 
(defcustom linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode doc-view-mode image-mode)
  "* List of modes disabled when global linum mode is on"
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum
  )
(defcustom linum-disable-starred-buffers 't
  "* Disable buffers that have stars in them like *Gnu Emacs*"
  :type 'boolean
  :group 'linum)

(defun linum-on ()
  "* When linum is running globally, disable line number in modes defined in `linum-disabled-modes-list'. Changed by linum-off. Also turns off numbering in starred modes like *scratch*"

  (unless (or (minibufferp)
              (member major-mode linum-disabled-modes-list)
              (string-match "*" (buffer-name))
              (> (buffer-size) 3000000)) ;; disable linum on buffer greater than 3MB, otherwise it's unbearably slow
    (linum-mode 1)))



;; toggle split windows
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "t" 'toggle-window-split)

(setq epg-gpg-program "/usr/local/bin/gpg")

(setq ring-bell-function 
     (lambda ()
       (unless (memq this-command
       	      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
         (ding))))



;; Set global key bindings for org mode


;; ask for y or n, instead of full yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; (setenv "PATH" (concat "~/usr/local/bin/octave" path-separator (getenv "PATH")))
(autoload 'run-octave "octave-inf" nil t)

(autoload 'octave-mode "octave-mode" t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; verbose mode for faults
(setq debug-on-error t)

;; allow C-n to make new lines, instead of RET
(setq next-line-add-newlines t)

(setq geiser-active-implementations '(racket))
(setq geiser-racket-binary "/usr/local/bin/racket")

; start inf-ruby automatically
(global-set-key (kbd "C-c r r") 'inf-ruby)




; Hopefully this will make leiningen and emacs play together
; (add-to-list 'exec-path "/usr/local/bin/lein")
;; (add-to-list 'exec-path "/usr/local/bin")
;; ; I have this stuff above!
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))



;; (defun eshell-mode-hook-func ()
;;   (setq eshell-path-env "/usr/local/bin")
;;   (setenv "PATH" "/usr/local/bin")
;;   (define-key eshell-mode-map (kbd "M-s") 'other-window-or-split))
 
;; (add-hook 'eshell-mode-hook 'eshell-mode-hook-func)


;; (if (string-equal system-type "darwin")
;;     (progn
;;       (menu-bar-mode -1) 
;;       (toggle-scroll-bar -1) 
;;       (tool-bar-mode -1)
;;       (add-to-list 'exec-path "/usr/local/bin")
;;       (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))))

(global-set-key (kbd "C-x y") 'previous-multiframe-window)


;; (setq browse-url-browser-function 'w3m-browse-url)
;;  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;  ;; optional keyboard short-cut
;;  (global-set-key "\C-xm" 'browse-url-at-point)

;; Opens To-Do when Emacs starts up 
(find-file "~/Documents/To-Do.org")

(use-package adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))
(add-hook 'adoc-mode-hook 'cider-mode)


(use-package fill-column-indicator
  :config
  (define-global-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode)))
  (global-fci-mode))


(use-package rainbow-mode
  :config
  (rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode))

; Define global minor mode for rainbow parentheses.
(use-package rainbow-delimiters
  :config
  (define-global-minor-mode global-rainbow-delimiters-mode rainbow-delimiters-mode
    (lambda () (rainbow-delimiters-mode)))
  (global-rainbow-delimiters-mode))

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

;; disable Buffer List
;(setq inhibit-startup-buffer-menu t)
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Buffer List*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))


(use-package ac-cider
  :config
  (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (eval-after-load "auto-complete"
    '(progn
       (add-to-list 'ac-modes 'cider-mode)
       (add-to-list 'ac-modes 'cider-repl-mode))))

	


;; fix the PATH variable
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))




;;;;;;;;;;;;;;;;;;;;;;;;;;; Multi-Scratch ;;;;;;;;;;;;;;;;;;;;;;
;;; Require
(require 'cl)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Customize ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defgroup multi-scratch nil
  "Multiple scratch manager."
  :group 'lisp)

(defcustom multi-scratch-buffer-name "multi-scratch"
  "The name of scratch buffer."
  :type 'string
  :group 'multi-scratch)

(defcustom multi-scratch-try-create t
  "Try to create a new scratch buffer when switch.

When use `multi-scratch-next' or `multi-scratch-prev',
switch scratch buffer, and try to create a new
scratch buffer if no scratch buffers exist."
  :type 'boolean
  :group 'multi-scratch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun multi-scratch-new (&optional prefix)
  "Create a new multi-scratch buffer.
Load `lisp-interaction' mode when PREFIX is nil."
  (interactive)
  ;; Set prefix if prefix is nil.
  (or prefix (setq prefix current-prefix-arg))
  ;; Create new scratch.
  (let* ((scratch-buffer (multi-scratch-get-buffer)))
    (set-buffer scratch-buffer)
    ;; Load `lisp-interaction' mode when prefix is nil.
    (unless prefix
      (lisp-interaction-mode))
    ;; Switch scratch buffer
    (switch-to-buffer scratch-buffer)))

(defun multi-scratch-next (&optional offset)
  "Switch to next scratch buffer.
If OFFSET is `non-nil', will switch next OFFSET scratch buffer."
  (interactive "P")
  (multi-scratch-switch 'NEXT (or offset 1)))

(defun multi-scratch-prev (&optional offset)
  "Switch to previous scratch buffer.
If OFFSET is `non-nil', will switch previous OFFSET scratch buffer."
  (interactive "P")
  (multi-scratch-switch 'PREVIOUS (or offset 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Utilities Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun multi-scratch-get-buffer ()
  "Get scratch buffer."
  (let* ((scratch-list-length (length (multi-scratch-list)))          ;get length of scratch list
         (index (if scratch-list-length (1+ scratch-list-length) 1))) ;setup new scratch index
    (with-temp-buffer
      ;; Return buffer
      (get-buffer-create (format "*%s<%s>*" multi-scratch-buffer-name index)))))

(defun multi-scratch-list ()
  "The scratch buffers presently active."
  ;; Autload command `remove-if-not'.
  (autoload 'remove-if-not "cl-seq")
  (sort
   (remove-if-not (lambda (b)
                    (string-match
                     (concat "^\*" multi-scratch-buffer-name)
                     (buffer-name b)))
                  (buffer-list))
   (lambda (a b)
     (< (string-to-number
         (cadr (split-string (buffer-name a) "[<>]")))
        (string-to-number
         (cadr (split-string (buffer-name b)  "[<>]")))))))

(defun multi-scratch-switch (direction offset)
  "Switch to scratch buffer.

If DIRECTION is `NEXT', switch to next scratch buffer.
If DIRECTION is `PREVIOUS', switch to previous scratch buffer.

Default OFFSET is 1.

If option `multi-scratch-try-create' is non-nil,
will create a new scratch buffer
if have any scratch buffer exist."
  (let (scratchs this-buffer)
    (setq scratchs (multi-scratch-list))
    (if (consp scratchs)
        (progn
          (setf (cdr (last scratchs)) scratchs)
          (setq this-buffer (position (current-buffer) (multi-scratch-list)))
          (if this-buffer
              (if (eql direction 'NEXT)
                  (switch-to-buffer (nth (+ this-buffer offset) scratchs))
                (switch-to-buffer (nth (+ (- (length (multi-scratch-list)) offset)
                                          this-buffer) scratchs)))
            (switch-to-buffer (car scratchs))))
      (if multi-scratch-try-create
          (progn
            (multi-scratch-new)
            (message "Create a new `multi-scratch' buffer."))
        (message "Haven't any `multi-scratch' buffer exist.")))))

(provide 'multi-scratch)
(require 'multi-scratch)




;;;; This replaces Emacs' own C-x C-e, which evaluates a sexp and places
;;;; the result in the echo area, the minibuffer. Instead I want the result
;;;; in the buffer itself.

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-x C-e") 'eval-and-replace)


(use-package multiple-cursors
  :bind (( "C-S-d" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))



;;;; Beeminder stuff
(use-package beeminder
  :config
  (setq beeminder-username "coyotespike")
  (setq beeminder-auth-token "nMAypdMtFXgKgBAasUF8"))

(global-set-key "\C-c \C-vb" 'beeminder-add-data)
;(global-set-key "\C-cbw" 'beeminder-whoami)
(global-set-key (kbd "C-c C-v C-g") 'beeminder-my-goals-org)
;(global-set-key "\C-cbr" 'beeminder-refresh-goal)
;(global-set-key "\C-cbt" 'beeminder-submit-clocked-time)

;;(require 'org-latex)
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
	     '("cv"
	       "\\documentclass[10pt]{article}\n\\usepackage[margin=.75in]{geometry}\n%\\usepackage{palatino}\n\\usepackage{sectsty}\n\\sectionfont{\\normalsize\\selectfont\\itshape}\n\\usepackage[T1]{fontenc}\n\\usepackage{libertine}\n\\renewcommand*\\oldstylenums[1]{{\\fontfamily{fxlj}\\selectfont
 #1}}"
	       ("\\section{%s}" . "\\section*{%s}")))

(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))


;;; ob-ipython
;(require 'ob-ipython)

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "/Users/timothyroy/anaconda2/envs/")

;(setq org-babel-python-command "python3")
;; (setq org-babel-python-command "python3")
;; (setenv "PYTHONPATH" "/Users/timothyroy/anaconda2/envs/snakes/bin/")
;(setenv "WORKON_HOME" "/Users/timothyroy/anaconda2/envs/snakes/")
;(setq org-babel-python-command "ipython --pylab=osx --pdb --nosep --classic --no-banner --no-confirm-exit")

;;; This is for plotting stuff
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)
   (latex . t)
;;   (clojure . t)
;;   (R . t)
   (sh . t)
   (sqlite . t)
   (python . t)
;   (ipython .t)
   ))

;; don’t prompt me to confirm everytime I want to evaluate a block
(setq org-confirm-babel-evaluate nil)

;;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)



(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(defun narrow-to-region-indirect (start end)
  "Restrict editing in this buffer to the current region, indirectly."
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
      (switch-to-buffer buf)))


;;; Helm
(use-package helm
  :bind (("M-y" . helm-show-kill-ring)
	 ("C-c h g" . helm-google-suggest))
  :config
  
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t))


;; For org-alert popups
(use-package org-alert
  :config
  (setq alert-default-style 'libnotify))



(add-to-list 'load-path "~/.emac.d/elpa/org-plus-contrib-20160926" t)
(require 'org-drill)
(use-package cl)
(use-package org
  :bind (("C-c d" . org-drill-resume)
	 ("\C-cl" . org-store-link)
	 ("\C-cc" . org-capture)
	 ("\C-ca" . org-agenda)
	 ("\C-cb" . org-iswitchb)
	 ;; (:map org-mode-map
	 ;;       ("C-c \" \"" . (lambda () (interactive)
	 ;; 			(org-zotxt-insert-reference-link '(4)))))

	 )

  :config
;; This makes interval items be scheduled more randomly, so they don't get grouped
;; only by when we added them.
  (setq org-drill-add-random-noise-to-intervals-p t)
;; This adjusts the due date if cards are reviewed early.
  (setq org-drill-adjust-intervals-for-early-and-late-repetitions-p t)
;; Prettifies font for clozes after they become visible
  (setq org-drill-use-visible-cloze-face-p t)
  (setq org-tag-alist '(("research" . ?r)
			("drill" . ?d)))
  (setq org-agenda-custom-commands
      '(("x" "again" 
	 ((agenda ""
		  ((org-agenda-skip-function '(my-skip-tag "drill"))))))))
  (setq org-agenda-include-diary t)
;  (add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
  )

(require 'ox-freemind)


(use-package kanban)
(require 'kanban)

(defun drill-card-count()
  "Print a message with the number of todo tasks in the current buffer"
  (interactive)
  (save-excursion 
    (goto-char (point-min))
    (message "Number of cards: %d" (count-matches ":drill:"))))

(defun my-skip-tag(tag)
    "Skip entries that are tagged TAG"
    (let* ((entry-tags (org-get-tags-at (point))))
      (if (member tag entry-tags)
          (progn (outline-next-heading) (point))
        nil)))

(defun how-many-str (regexp str)
  (loop with start = 0
        for count from 0
        while (string-match regexp str start)
        do (setq start (match-end 0))
        finally return count))

(defun my-count-tag(tag)
    "count entries that are tagged TAG"
    (let* ((entry-tags (org-get-tags-at (point)))
	   (total 0))
      (if (member tag entry-tags)
	    (progn (setq total (+ total 1)) (outline-next-heading) (point))
        total)))


(defun org-count-todo()
  "Print a message with the number of todo tasks in the current buffer"
  (interactive)
  (save-excursion 
    (goto-char (point-min))
   (message "Number of TODO: %d" (count-matches "* TODO"))))

									     
(defun org-count-done()
  "Print a message with the number of done tasks in the current buffer"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (message "Number of DONE: %d" (count-matches "* DONE"))))




;; Add an effort estimate on the fly, for calibration.
;; I'll simply use minutes as my estimates.
(add-hook 'org-clock-in-prepare-hook
          'my/org-mode-ask-effort)

(defun my/org-mode-ask-effort ()
  "Ask for an effort estimate when clocking in."
  (unless (org-entry-get (point) "Effort")
    (let ((effort
           (completing-read
            "Effort: "
            (org-entry-get-multivalued-property (point) "Effort"))))
      (unless (equal effort "")
        (org-set-property "Effort" effort)))))

(defun my-org-time-stamp () (interactive) (let ((current-prefix-arg '(16))) (call-interactively 'org-time-stamp)))

(setq org-capture-templates
      `(
	("t" "Todo" 
	 entry 
         (file+headline "~/Documents/To-Do.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")

	("c" "Contacts" entry (file "~/Documents/Contacts.org")
               "* %(org-contacts-template-name)
SCHEDULE: %(org-time-stamp t)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:URL:
:WORK: 
:MOBILE:
:LOCATION:
:BIRTHDAY:
:NOTE: 
:END:")

	("j" "Exercise journal" entry (file+datetree "~/Documents/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")

	("u"
         "Task: Read this URL"
         entry
         (file+headline "~/Documents/To-Do.org" "Tasks")
         ,(concat "* TODO Read article: '%:description'        :"
                  (format "%s" org-drill-question-tag)
		  ":\n %i\n  %a")
         :empty-lines 1
         :immediate-finish t)

        ("w"
         "Capture web snippet"
         entry
         (file+headline "~/Documents/To-Do.org" "Tasks")
         ,(concat "* Fact: '%:description'        :"
                  (format "%s" org-drill-question-tag)
                  ":\n:PROPERTIES:\n:DATE_ADDED: %u\n:SOURCE_URL: %a\n:END:\n\n%i\n%?\n")
         :empty-lines 1
         :immediate-finish t)              
	))

;;           SCHEDULED: %(call-interactively 'org-time-stamp)


;; This fixes a problem where Emacs tried to use Dbus to send messages.
;; Dbus isn't really used on OSX.
(setq org-show-notification-handler
      '(lambda (notification)
         (todochiku-message "org-mode notification" notification
                            (todochiku-icon 'emacs))))
;; Instead we use todochiku to send message
(use-package todochiku)

(use-package solidity-mode)

;;; This makes Emacs use the shell's search path, so that we don't have to
;;; maintain two separate paths.
;; (exec-path-from-shell-initialize)
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

(use-package pianobar
  :config
  (setq pianobar-username "roy.tim@gmail.com")
  (setq pianobar-password "peace13")
  (autoload 'pianobar "pianobar" nil t)
  :bind
  (("C-S-m m" . pianobar)
   ("C-S-m n" . pianobar-next-song)
   ("C-S-m c" . pianobar-change-station)
   ("C-S-m l" . pianobar-love-current-song)
   ("C-S-m h" . pianobar-ban-current-song)
   ("C-S-m p" . pianobar-play-or-pause)
   ("C-S-m u" . pianobar-volume-up)
   ("C-S-m d" . pianobar-volume-down)
   ))

(defun pianobar-volume-up ()
  "Tell pianobar to turn the volume up."
  (interactive)
  (pianobar-send-command ?\)))

(defun pianobar-volume-down ()
  "Tell pianobar to turn the volume down."
  (interactive)
  (pianobar-send-command ?\())


(require 'org-contacts)
(setq org-contacts-file "~/Documents/Contacts.org")


;;;; This function fixes a bug in org-drill by modifying org.el
(defun my:work-around-org-window-drill-bug ()
        (save-excursion
          (let ((org-library-location (concat
                                       (locate-library "org" 'nosuffix)
                                       ".el")))
            (with-current-buffer (find-file-noselect org-library-location)
              (goto-char (point-min))
              (search-forward "(set-window-start nil window-start)")
              (back-to-indentation)
              (if (looking-at ";; ")
                  (message "Already modified `org-toggle-latex-fragment' for `org-drill'")
                (insert ";; ")
                (save-buffer)
                (byte-compile-file org-library-location)
                (elisp--eval-defun)
                (message "Modified `org-toggle-latex-fragment' for `org-drill'"))))))

;; (my:work-around-org-window-drill-bug)


;;; Smex
(use-package smex
  :bind (( "M-x" . smex)))

;; Ace-jump-mode's successor avy
(use-package avy
  ;; This overrides the built-in C-j, which enters a space below the current line.
  :init
  (bind-key* "C-j" 'avy-goto-word-or-subword-1))

(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(defvar aw-dispatch-alist
'((?x aw-delete-window " Ace - Delete Window")
    (?m aw-swap-window " Ace - Swap Window")
    (?n aw-flip-window)
    (?v aw-split-window-vert " Ace - Split Vert Window")
    (?b aw-split-window-horz " Ace - Split Horz Window")
    (?i delete-other-windows " Ace - Maximize Window")
    (?o delete-other-windows))
"List of actions for `aw-dispatch-default'.")


;;; Jump to spelling errors
;;(add-to-list 'load-path "/Users/timothyroy/.emacs.d/elpa/ace-flyspell-20150523.1115/ace-flyspell.el")

(use-package ace-flyspell
  :config
  (ace-flyspell-setup))

;;; Annotations
(global-set-key (kbd "M-n") 'org-annotate-file)

(fset 'get-stats
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 107 return 134217840 24 98 109 101 115 115 97 103 101 115 return 134217790 18 105 116 101 109 115 18 18 18 18 1 67108896 14 14 14 14 14 14 14 14 14 14 134217847 134217840 134217790 16 16 16 16 16 16 16 16 return 16 25 3 16 14 67108896 5 134217847 16 1 tab 134217790 25 return 134217840 24 98 return 14] 0 "%d")) arg)))

;(global-set-key (kbd "C-c ,") 'org-priority)

(eval-after-load "org"
  '(require 'ox-md nil t))

(defun capture-report-data-file (path)
  (let ((name (read-string "Name: ")))
    (expand-file-name (format "%s-%s.org"
                              (format-time-string "%Y-%m-%d")
                              name) path)))

(defun capture-file-name-without-date (path)
  (let ((name (read-string "Name: ")))
    (expand-file-name (format "%s.org"
                              name) path)))

(add-to-list 'org-capture-templates
             '("b" "Blog entry" plain
	       (file (capture-report-data-file "~/Documents/Startup/lanyon-plus/_drafts"))
"
#+BEGIN_HTML
---
layout: post
title:
date: %<%Y-%m-%d %H:%M>
# Should be longer than 20 words, so it will appear as post summary
description:
# tags will also be used as html meta keywords.
tags:
  - 

show_meta: true
comments: true
mathjax: true
gistembed: true
published: true
noindex: false
nofollow: false
---
#+END_HTML
"))


(add-to-list 'org-capture-templates
             '("l" "latex letter" plain
	       (file (capture-file-name-without-date "~/Documents/"))
"
#+OPTIONS: toc:nil
#+OPTIONS: num:nil
#+OPTIONS: author:nil timestamp:nil
#+LATEX_HEADER: \\usepackage{parskip}
#+LATEX_HEADER: \\usepackage{setspace}
#+LATEX_HEADER: \\pagestyle{empty}
#+LATEX_HEADER: \\usepackage[margin=1.5in]{geometry}
#+LATEX_HEADER: \\usepackage[en-US]{datetime2}
#+LATEX_HEADER: \\setlength{\\parindent}{1cm}
#+BEGIN_LATEX
\\setlength\\parskip{0mm}

\\vspace{-12pt}\%y
\\begin{flushright}
\\today\n
Austin, Texas\n
  \\hrulefill
\\end{flushright}
#+END_LATEX

#+BEGIN_LATEX

\\setlength\\parskip{5mm}

\\doublespacing

Delete me and write here!

Yours,

Timothy Roy

#+END_LATEX
"))



(setq org-publish-project-alist
      '(
  ("org-blog"
          ;; Path to your org files.
          :base-directory "/Users/timothyroy/Documents/Writing/"
          :base-extension "org"

          :publishing-function org-md-publish-to-md
          :headline-levels 4

          :publishing-directory "~/Documents/Startup/lanyon-plus/_posts/")
  ("org-blog2"
          ;; Path to your org files.
          :base-directory "/Users/timothyroy/Documents/"
          :base-extension "org"

          :publishing-function org-md-publish-to-md
          :headline-levels 4

          :publishing-directory "~/Documents/Startup/lanyon-plus/_posts/")
  ("org-blog3"
          ;; Path to your org files.
          :base-directory "/Users/timothyroy/Documents/Startup/lanyon-plus/_drafts/"
          :base-extension "org"

          :publishing-function org-md-publish-to-md
          :headline-levels 4

          :publishing-directory "~/Documents/Startup/lanyon-plus/_posts/")))

;; This setup is tested on Emacs 24.3 & Emacs 24.4 on Linux/OSX
;; org v7 bundled with Emacs 24.3
(setq org-export-odt-preferred-output-format "doc")
;; org v8 bundled with Emacs 24.4
(setq org-odt-preferred-output-format "doc")
;; BTW, you can assign "pdf" in above variables if you prefer PDF format

;; Only OSX need below setup
(defun my-setup-odt-org-convert-process ()
  (interactive)
  (let ((cmd "/Applications/LibreOffice.app/Contents/MacOS/soffice"))
    (when (and (eq system-type 'darwin) (file-exists-p cmd))
      ;; org v7
      (setq org-export-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i")))
      ;; org v8
      (setq org-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i"))))
    ))
(my-setup-odt-org-convert-process)

;;; This changes the backup directory, so all randomfile.org~ backup files go there.
;;; Now I can run automatic git backups.
(setq backup-directory-alist `(("." . "~/.saves")))


(use-package wc-mode
  :config
  (wc-mode))

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs" . clojurescript-mode))
;;; Add paredit for clojure
;; (use-package paredit
;;   :config
;;   '(add-hook 'clojure-mode-hook #'paredit-mode))
;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; (use-package aggressive-indent
;;   :config
;;   (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

;; http://shaunlebron.github.io/parinfer/#tools-for-writing-lisp
;; (add-to-list 'load-path "/Users/timothyroy/parinfer-mode")
;; (require 'parinfer-mode)
;; (add-hook 'clojure-mode-hook 'parinfer-mode)
;; (add-hook 'clojurescript-mode-hook 'parinfer-mode)

(add-to-list 'load-path "/Users/timothyroy/fantastical-capture")
(autoload 'send-region-to-fantastical "fantastical-capture" "Send region to Fantastical" t)
(global-set-key (kbd "C-c f") 'send-region-to-fantastical)
;; (use-package clj-refactor
;;   :config
;;   '(add-hook 'clojure-mode-hook #'clj-refactor-mode))
;; (use-package cljr-helm
;;   :bind (("C-c C-r" . cljr-helm)))

(use-package magit
  :bind (("C-x g" . magit-status)))


(require 'iso-transl)

;; MAKRA PRO PISMENA S HACKEM
;; d-caron 010F
;; n-caron 0148
;; t-caron 0165
;; S-caron 0160
;; C-caron 010C
;; R-caron 0158
;; Z-caron 017D
(fset 'd-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 48 70 return] 0 "%d")) arg)))
(fset 'n-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 52 56 return] 0 "%d")) arg)))
(fset 't-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 54 53 return] 0 "%d")) arg)))
(fset 'S-caron
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 54 48 return] 0 "%d")) arg)))
(fset 's-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 54 49 return] 0 "%d")) arg)))
(fset 'C-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 48 67 return] 0 "%d")) arg)))
(fset 'R-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 53 56 return] 0 "%d")) arg)))
(fset 'Z-caron
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 48 49 55 68 return] 0 "%d")) arg)))

(global-set-key (kbd "<S-dead-caron> d") 'd-caron)
(global-set-key (kbd "<S-dead-caron> n") 'n-caron)
(global-set-key (kbd "<S-dead-caron> t") 't-caron)
;;(global-set-key (kbd "<S-dead-caron> S") 'S-caron)
(global-set-key (kbd "C-x 8 ' s") 's-caron)
(global-set-key (kbd "<S-dead-caron> C") 'C-caron)
(global-set-key (kbd "<S-dead-caron> R") 'R-caron)
(global-set-key (kbd "<S-dead-caron> Z") 'Z-caron)

;; (use-package w3m
;;   :commands (w3m-browse-url w3m-session-crash-recovery-remove)
;;   :init
;;   (eval-when-compile
;;     (autoload 'w3m-search-escape-query-string "w3m-search")))
;; (use-package helm-w3m)

;; Install Intero
;; (use-package intero
;;   :config
;;   '(add-hook 'haskell-mode-hook 'intero-mode))

(use-package clojure-cheatsheet
  :bind (:map cider-mode-map
			("C-c M-h" . clojure-cheatsheet)))

(put 'dired-find-alternate-file 'disabled nil)

(use-package vagrant-tramp)
;;(setq tramp-default-method "ssh")
(setq tramp-verbose 6)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; Auto-refresh dired on file change. nice.
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
	;; This would override `fill-column' if it's an integer.
	(emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)



;;; Allow me to change file permissions in Dired mode
(setq wdired-allow-to-change-permissions t)

(use-package org-pomodoro)

(setq org-agenda-clockreport-parameter-plist 
 '(:fileskip0 t :link t :maxlevel 2 :formula "$5=($3+$4)*(60/25);t"))

(use-package org-wc)
(use-package wc-goal-mode)
;; I added the below line because Emacs kept bugging me to include it.
;; Just add the damn thing yourself, Emacs.
(provide '.emacs)
;;; emacs ends here
