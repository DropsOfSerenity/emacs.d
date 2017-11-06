(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Initialize packages first
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package obsidian-theme)
(use-package whitespace-cleanup-mode)
(use-package ido-vertical-mode)
(use-package projectile)
(use-package flx-ido)
(use-package which-key)
(use-package exec-path-from-shell)
(use-package autopair)
(use-package auto-complete)
(use-package helm)
(use-package magit)
(use-package rtags)
(use-package cmake-ide)
(use-package ruby-tools)
(use-package rspec-mode)
(use-package flymake-ruby)
(use-package web-mode)
(use-package smex)

(require 'subr-x)
(require 'defaults)
(require 'appearance)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; vertical ido is better.
(require 'ido-vertical-mode)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'which-key)
(which-key-mode)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Enable projectile globally
(projectile-global-mode)

;; pair braces automatically {} () []
(autopair-global-mode)

;; Enable auto completion
(ac-config-default)

;; Enable helm
(require 'helm-config)
(helm-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (obsidian-theme web-mode which-key helm-bind-key helm exec-path-from-shell rspec-mode solarized-theme flx-ido ruby-tools ido-vertical-mode flymake-ruby subr+ ag rtags htmlize ox-twbs smex monokai-theme cmake-ide php-mode yaml-mode emmet-mode autopair aggressive-indent magit projectile haml-mode coffee-mode better-defaults auto-complete))))

(require 'cconfig)
(require 'railsconfig)
(require 'defuns)

;; Custom keybinds
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1))) ; Join line below
(global-set-key (kbd "M-x") 'smex)
(define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(global-set-key (kbd "C-x g") 'magit-status)

;; make emacs fullscreen
(toggle-frame-fullscreen)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "Ubuntu Mono")))))
