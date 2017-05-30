;; cmake ide
(require 'rtags)
(cmake-ide-setup)

;; C/C++ indentation
(c-add-style "msi-style"
             '((c-comment-only-line-offset . 0)
               (c-hanging-braces-alist . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (topmost-intro-cont   . 0)
                                   (substatement         . 4)
                                   (substatement-open    . 0)
                                   (statement-case-open  . 4)
                                   (statement-cont       . 4)
                                   (access-label         . -4)
                                   (inclass              . 4)
                                   (inline-open          . 4)
                                   (innamespace          . -4)
                                   ))))

;; add inline files to c++ mode as well.
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

;; c/c++ mode style
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "msi-style")
             ))


;; Don't ask to reload TAGS if newer, just do it
(setq tags-revert-without-query 1)

(provide 'cconfig)
