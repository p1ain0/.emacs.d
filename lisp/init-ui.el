
;;don't display the startup screen.
(setq inhibit-startup-screen t)
(toggle-frame-maximized)

;; adjust the fonts
;(defun available-font (font-list)
;  "Get the first available font from FONT-LIST."
;  (catch 'font
;    (dolist (font font-list)
;      (if (member font (font-family-list))
;	  (throw 'font font)))))

;;;###autoload
;(defun cabins/setup-font ()
;  "Font setup."

;  (interactive)
;  (let* ((efl '("Cascadia Code" "Source Code Pro" "JetBrains Mono" "Courier New" "Monaco" "Ubuntu Mono"))
;	 (cfl '("楷体" "黑体" "STHeiti" "STKaiti"))
;	 (cf (available-font cfl))
;	 (ef (available-font efl)))
;    (when ef
;      (dolist (face '(default fixed-pitch fixed-pitch-serif variable-pitch))
;	(set-face-attribute face nil :family ef)))
;    (when cf
;      (dolist (charset '(kana han cjk-misc bopomofo))
;	(set-fontset-font t charset cf))
;      (setq face-font-rescale-alist
;	    (mapcar (lambda (item) (cons item 1.2)) cfl)))))

;; settings for daemon mode
;(if (daemonp)
;    (add-hook 'after-make-frame-functions
;	      (lambda (frame)
;		(with-selected-frame frame
;		  (cabins/setup-font))))
;  (add-hook 'after-init-hook #'cabins/setup-font))

(set-face-attribute 'default nil :height 120)


(provide 'init-ui)

;;; init-ui.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
