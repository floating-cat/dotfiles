
(setq gc-cons-threshold (* gc-cons-threshold 32))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(setq package-quickstart t)

;; faster to disable these here (before they've been initialized)
(setq tool-bar-mode nil
      menu-bar-mode nil
      scroll-bar-mode nil)
(modify-all-frames-parameters '((vertical-scroll-bars)))
