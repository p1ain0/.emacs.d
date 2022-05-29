;;deal encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)

;;approve speed
(setq gc-cons-threshold most-positive-fixnum)

(setq auto-save-default nil)

;(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-system)
