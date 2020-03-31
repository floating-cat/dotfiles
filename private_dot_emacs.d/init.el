(defun hide-message-temporarily ()
  (setq inhibit-message t)
  (run-with-idle-timer 0 nil (lambda () (setq inhibit-message nil))))
;; remove annoying messages when startup
(hide-message-temporarily)
;; remove annoying messages when use emacsclient
(add-hook 'server-after-make-frame-hook #'hide-message-temporarily)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(eval-when-compile
  (require 'use-package))

(use-package smart-mode-line
  :config (sml/setup))

(use-package ivy
  :bind
  (:map ivy-minibuffer-map
        ("C-?" . hydra-ivy/body)
        ("s-a" . ivy-avy))
  :config (ivy-mode))

(use-package swiper
  :bind
  ("C-s" . swiper-isearch)
  ("C-r" . swiper-isearch-backward)
  (:map swiper-map
        ("s-a" . swiper-avy)))

(use-package counsel
  :demand
  :bind
  ("C-x C-b" . ivy-switch-buffer-other-window)
  :config (counsel-mode))

(use-package avy
  :bind
  ("s-a" . avy-goto-char-timer)
  ("s-l" . avy-goto-line))

(use-package company
  :demand
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-j" . company-complete-selection))
  :config (global-company-mode))

(use-package company-flx
  :config (company-flx-mode))

(use-package company-quickhelp
  :config (company-quickhelp-mode))

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode))

(use-package iedit)

(use-package flycheck
  :config (global-flycheck-mode))

(use-package smartparens-config
  :config
  (smartparens-global-mode)
  (sp-pair "（" "）"))

(use-package whitespace
  :hook (find-file . (lambda ()
                       ;; disable error highlight for error when view buffer read only files
                       (unless (eq buffer-read-only 't)
                         (if (not (derived-mode-p 'prog-mode))
                             (setq-local whitespace-style '(face tabs trailing))
                           (setq-local whitespace-style '(face tabs trailing lines-tail))
                           (setq-local whitespace-line-column 100))
                         (whitespace-mode)))))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package magit
  :bind ("s-j" . magit-status)
  :hook (magit-status-mode . (lambda ()
                               (setq truncate-lines nil))))

(use-package projectile
  :bind-keymap
  ("s-p" . projectile-command-map)
  :bind
  (:map projectile-mode-map
        ("s-s" . projectile-switch-project)
        ("s-f" . projectile-find-file)
        ("s-g" . projectile-grep)
        ("s-F" . projectile-find-file-in-known-projects))
  :config (projectile-mode))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  ("M-0" . treemacs-select-window)
  ("s-t" . treemacs)
  (:map treemacs-mode-map
        ("<mouse-1>" . treemacs-single-click-expand-action)))

(use-package lsp-mode
  :hook (scala-mode . lsp))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :config
  ;; not find in customize
  (setq company-lsp-cache-candidates 'auto)
  (push 'company-lsp company-backends))

;; metals
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package counsel-dash
  :hook (scala-mode . (lambda () (setq-local counsel-dash-docsets '("Scala"))))
  :config
  ;; put this custom here in order to remove warning (defvaralias)
  (setq counsel-dash-min-length 2)
  (defalias 'remove-duplicates 'cl-remove-duplicates))

(use-package helm-descbinds
  :commands (helm-descbinds))

(use-package helpful
  :bind
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key))

(use-package keyfreq
  :config
  (keyfreq-mode)
  (keyfreq-autosave-mode))

;; (load "~/.emacs.d/third_party")
