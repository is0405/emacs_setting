;;; show-font-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "show-font-mode" "show-font-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from show-font-mode.el

(defvar show-font-mode nil "\
Non-nil if Show-Font mode is enabled.
See the `show-font-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `show-font-mode'.")

(custom-autoload 'show-font-mode "show-font-mode" nil)

(autoload 'show-font-mode "show-font-mode" "\
Toggle display of font at point in the mode line (show font mode).

With a prefix argument ARG, enable show-font-mode if ARG is
positive, and disable it otherwise.

If called from Lisp, enable the mode if ARG is omitted or nil.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "show-font-mode" '("show-font-mode-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; show-font-mode-autoloads.el ends here
