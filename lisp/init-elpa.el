(require 'package)
(setq package-check-signature nil
      load-prefer-newer t)
(add-to-list 'package-archives '(("gnu" . "https://elpa.gnu.org/packages")
				 ("melpa" . "https://melpa.org/packages/"))
				 
)

;;; initialize the packages, avoiding a re-initialization
(unless (bound-and-true-p package-initialized) ;; To avoid warnings on 27
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; settings for use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; configure use-package prior to loading it
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-always-defer t
        use-package-expand-minimally t)
  (require 'use-package))

(use-package gnu-elpa-keyring-update)
(use-package diminish)
(use-package delight)

(provide 'init-elpa)
