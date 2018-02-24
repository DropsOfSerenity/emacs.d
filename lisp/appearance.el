(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; No splash screen
(setq inhibit-startup-message t)

;; my colors

(pretty-fonts-set-kwds
 '((pretty-fonts-fira-font prog-mode-hook org-mode-hook)))

;; (set-face-attribute 'font-lock-builtin-face nil :foreground "blue" :weight 'normal)
;; (set-face-attribute 'font-lock-comment-face nil :foreground "olive drab" :slant 'italic)
;; (set-face-attribute 'font-lock-constant-face nil :foreground "blue")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "olive drab")

;; (set-face-attribute 'font-lock-function-name-face nil :foreground "chocolate" :weight 'normal)
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "navy" :weight 'normal)
;; (set-face-attribute 'font-lock-string-face nil :foreground "chocolate")
;; (set-face-attribute 'font-lock-type-face nil :foreground "black")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "black")

;; (set-foreground-color "black")
;; (set-background-color "white")
;; (set-cursor-color "black")

(load-theme 'minimal t)

(provide 'appearance)
