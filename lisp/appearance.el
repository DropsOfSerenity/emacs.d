(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; No splash screen
(setq inhibit-startup-message t)

;; my colors
(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F" :weight 'bold)
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3" :weight 'normal)
(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3" :weight 'bold)
(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")

(set-foreground-color "burlywood3")
(set-background-color "#161616")
(set-cursor-color "#40FF40")

(provide 'appearance)
