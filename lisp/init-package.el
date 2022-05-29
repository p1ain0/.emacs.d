
;;theme
(use-package gruvbox-theme 
    :init (load-theme 'gruvbox-dark-soft t))

;;
(use-package smart-mode-line 
    :init 
    (setq sml/no-confirm-load-theme t) 
    (setq sml/theme 'respectful) 
    (sml/setup))

;;计算启动时间
(use-package benchmark-init 
  :init (benchmark-init/activate) 
  :hook (after-init . benchmark-init/deactivate))

;;用y/n来代替yes/no
(use-package emacs :config (defalias 'yes-or-no-p 'y-or-n-p))

;;显示行号
(use-package emacs 
    :config 
    (setq display-line-numbers-type 'relative) 
    (global-display-line-numbers-mode t))

;; 通过修改字体解决Windows上Emacs的卡顿
(use-package emacs 
  :if (display-graphic-p) 
  :config 
  ;; Font settings 
  (if *is-windows* 
    (progn 
      (set-face-attribute 'default nil :font "Microsoft Yahei Mono 9") 
      (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Microsoft Yahei Mono" :size 12)))) 
  (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

;;windows change fonts
(use-package emacs 
  :if (display-graphic-p) 
  :config 
  ;; Font settings 
  (if *is-windows* 
    (progn 
      (set-face-attribute 'default nil :font "Microsoft Yahei Mono 9") 
      (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Microsoft Yahei Mono" :size 12)))) 
  (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

;;块移动
(use-package drag-stuff 
  :bind (("<M-up>". drag-stuff-up) 
         ("<M-down>" . drag-stuff-down)))


;;强化搜索替换

(use-package ivy 
  :defer 1 
  :demand 
  :hook (after-init . ivy-mode) 
  :config 
  (ivy-mode 1) 
  (setq ivy-use-virtual-buffers t 
        ivy-initial-inputs-alist nil 
        ivy-count-format "%d/%d " 
        enable-recursive-minibuffers t 
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))) 

(use-package counsel 
  :after (ivy) 
  :bind (("M-x" . counsel-M-x) 
         ("C-x C-f" . counsel-find-file) 
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git))) 

(use-package swiper 
  :after ivy 
  :bind (("C-s" . swiper) 
         ("C-r" . swiper-isearch-backward)) 
  :config (setq swiper-action-recenter t 
                swiper-include-line-number-in-search t))

;;自动补全插件

(use-package company 
  :config 
  (setq company-dabbrev-code-everywhere t 
        company-dabbrev-code-modes t 
        company-dabbrev-code-other-buffers 'all 
        company-dabbrev-downcase nil 
        company-dabbrev-ignore-case t 
        company-dabbrev-other-buffers 'all 
        company-require-match nil 
        company-minimum-prefix-length 2 
        company-show-numbers t 
        company-tooltip-limit 20 
        company-idle-delay 0 
        company-echo-delay 0 
        company-tooltip-offset-display 'scrollbar 
        company-begin-commands '(self-insert-command)) 
  (push '(company-semantic :with company-yasnippet) company-backends) 
  :hook ((after-init . global-company-mode)))

;;语法检查

;(use-package flycheck 
;  :hook (after-init . global-flycheck-mode))

;;crux- 优化版的回到行首
;;快速打开Emacs配置文件
;;快速连接两行等
(use-package crux 
  :bind (("C-a" . crux-move-beginning-of-line) 
         ("C-c ^" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c k" . crux-smart-kill-line)))

;;快捷键提醒
(use-package which-key 
  :defer nil 
  :config (which-key-mode))

;;
(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist 
    '((swiper . ivy-posframe-display-at-frame-center)
      (complete-symbol . ivy-posframe-display-at-point)
      (counsel-M-x . ivy-posframe-display-at-frame-center)
      (counsel-find-file . ivy-posframe-display-at-frame-center)
      (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
      (t . ivy-posframe-display-at-frame-center)))
)
(provide 'init-package)
;;;
