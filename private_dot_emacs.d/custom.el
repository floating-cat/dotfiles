(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-package-update-delete-old-versions t)
 '(auto-package-update-hide-results t)
 '(auto-package-update-interval 4)
 '(avy-timeout-seconds 0.3)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-quickhelp-delay 0)
 '(company-show-numbers t)
 '(counsel-describe-function-function 'helpful-callable)
 '(counsel-describe-variable-function 'helpful-variable)
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e"))
 '(iedit-toggle-key-default (kbd "s-r"))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-extra-directories '("../"))
 '(ivy-initial-inputs-alist nil)
 '(ivy-re-builders-alist
   '((swiper . ivy--regex-plus)
     (swiper-isearch . ivy--regex-plus)
     (t . ivy--regex-fuzzy)) t)
 '(ivy-use-virtual-buffers t)
 '(lsp-prefer-flymake nil)
 '(mouse-drag-copy-region t)
 '(package-selected-packages
   '(company-quickhelp helpful editorconfig yasnippet use-package helm-descbinds smartparens iedit counsel-dash esup amx keyfreq smart-mode-line counsel-projectile company-flx flx company-yasnippet treemacs-magit treemacs-projectile lsp-ui projectile sbt-mode scala-mode company-lsp flycheck))
 '(projectile-completion-system 'ivy)
 '(projectile-project-search-path '("~/Projects/"))
 '(require-final-newline t)
 '(rm-whitelist "Fly.*")
 '(save-interprogram-paste-before-kill t)
 '(savehist-mode t)
 '(sml/mule-info nil)
 '(sml/show-remote nil)
 '(sml/theme 'light))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "LightSkyBlue1"))))
 '(whitespace-line ((t (:inherit font-lock-warning-face :underline t))))
 '(whitespace-tab ((t (:background "red1")))))

(setq
 backup-directory-alist `(("." . ,(concat user-emacs-directory "auto-save")))
 auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "auto-save") t))
 ;; https://github.com/syl20bnr/spacemacs/issues/12110#issuecomment-504079398
 undo-limit (* undo-limit 10)
 undo-outer-limit (* undo-outer-limit 10)
 undo-strong-limit (* undo-strong-limit 10)
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
