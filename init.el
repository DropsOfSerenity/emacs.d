(add-to-list 'load-path "~/.emacs.d/lisp/")

;; SAD buffer files
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))

;; save all buffers on focus out
(defun save-all ()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)

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

(use-package restclient
  :init
  (add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode)))
(use-package ag)
(use-package whitespace-cleanup-mode)
(use-package ido-vertical-mode)
(use-package projectile)
(use-package flx-ido)
(use-package which-key)
(use-package exec-path-from-shell)
(use-package autopair)
(use-package auto-complete)
(use-package string-inflection
  :init
  (global-set-key (kbd "C-c i") 'string-inflection-cycle)
  (global-set-key (kbd "C-c c") 'string-inflection-lower-camelcase)
  (global-set-key (kbd "C-c C") 'string-inflection-camelcase)
  (global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)
  (global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle))

(use-package helm
  :init
  (require 'helm-config)
  (helm-mode 1))

(use-package magit)
(use-package rtags)
(use-package cmake-ide)
(use-package ruby-tools)
(use-package rspec-mode)
(use-package flymake-ruby)

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))

(use-package smex)
(use-package markdown-mode)

(require 'subr-x)
(require 'defaults)
(require 'pretty-fonts)
(require 'appearance)
(require 'whitespace)

;; vertical ido is better.
(require 'ido-vertical-mode)
(require 'flx-ido)
(ido-mode 1)
(ido-vertical-mode 1)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "06ffa2bf4e891580bfe6a5ce68d0909ed9c4278e5234ede6b3ba459ef35d9a1b" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (minimal-theme cherry-blossom-theme firecode-theme monokai-alt-theme pretty-mode restclient string-inflection string-inflections markdown-mode web-mode which-key helm-bind-key helm exec-path-from-shell rspec-mode solarized-theme flx-ido ruby-tools ido-vertical-mode flymake-ruby subr+ ag rtags htmlize ox-twbs smex monokai-theme cmake-ide php-mode yaml-mode emmet-mode autopair aggressive-indent magit projectile haml-mode coffee-mode better-defaults auto-complete))))

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
; (toggle-frame-fullscreen)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code")))))
