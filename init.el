(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Initialize packages
(package-initialize)

;; No splash screen
(setq inhibit-startup-message t)

;; Enable projectile globally
(projectile-global-mode)

;; Custom colors
(set-background-color "gray15")
(set-foreground-color "burlywood1")
(set-face-background 'mode-line "burlywood1")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "white")
(set-face-attribute 'font-lock-keyword-face nil :foreground "orange1")
(set-face-attribute 'font-lock-comment-face nil :foreground "yellow1")
(set-face-attribute 'font-lock-keyword-face nil :foreground "white")
(set-face-attribute 'font-lock-string-face nil :foreground "snow2")
(add-to-list 'default-frame-alist '(font . "Source Code Pro-13"))
(set-face-attribute 'default t :font "Source Code Pro-13")
;; font-lock-warning-face
;; font-lock-function-name-face
;; font-lock-variable-name-face
;; font-lock-keyword-face
;; font-lock-comment-face
;; font-lock-comment-delimiter-face
;; font-lock-type-face
;; font-lock-constant-face
;; font-lock-builtin-face
;; font-lock-preprocessor-face
;; font-lock-string-face
;; font-lock-doc-face
;; font-lock-negation-char-face

;; Enable auto completion
(ac-config-default)

;; clean up whitespace before save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; indent agressively
(global-aggressive-indent-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (aggressive-indent magit projectile haml-mode coffee-mode better-defaults auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
