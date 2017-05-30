(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Initialize packages first
(package-initialize)

(require 'subr-x)
(require 'defaults)
(require 'appearance)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Enable projectile globally
(projectile-global-mode)

;; pair braces automatically {} () []
(autopair-global-mode)

;; Enable auto completion
(ac-config-default)

;; indent agressively
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes '(haml-mode python-mode))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (subr+ ag rtags htmlize ox-twbs smex monokai-theme cmake-ide php-mode yaml-mode emmet-mode autopair aggressive-indent magit projectile haml-mode coffee-mode better-defaults auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
