;; don't make files~ or autosaves
(setq make-backup-files nil)
(setq auto-save-default nil)

;; don't indent tabs
(setq-default indent-tabs-mode nil)

;; delete selections on keypress in visual select
(delete-selection-mode t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; less typing
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'defaults)
