
;; functions
(defun backward-kill-line ()
  "Kill a backward line"
  (interactive)
  (kill-line -1)
  )

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(defun kill-line-or-region ()
  "kills current line or region."
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning)(region-end))
    (kill-region (line-beginning-position) (line-end-position))
    )
  )

(defun my-insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%Y-%m-%d %H:%M") 
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%A, %d. %B %Y")))
          )
      (insert (format-time-string format))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               insert a file name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-insert-file-name (filename &optional args)
    "Insert name of file FILENAME into buffer after point.
  
  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.
  
  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.
  
  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
    ;; Based on insert-file in Emacs -- ashawley 20080926
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (file-relative-name filename)))
          ((not (null args))
           (insert (expand-file-name filename)))
          (t
           (insert filename))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;Cleanup commands;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(global-set-key (kbd "C-i") 'previous-line)
(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "C-l") 'forward-char)
(global-set-key (kbd "C-j") 'backward-char)
(global-set-key (kbd "C-S-i") 'scroll-down)
(global-set-key (kbd "C-S-k") 'scroll-up)
(global-set-key (kbd "C-S-l") 'forward-word)
(global-set-key (kbd "C-S-j") 'backward-word)
(global-set-key (kbd "C-x C-l") 'end-of-line)
(global-set-key (kbd "C-x C-j") 'beginning-of-line)
(global-set-key (kbd "C-x C-k") 'end-of-buffer)
(global-set-key (kbd "C-x C-i") 'beginning-of-buffer)

(global-set-key (kbd "M-d") 'other-window)
(global-set-key (kbd "C-o") 'split-window-right)
(global-set-key (kbd "C-S-o") 'split-window-below)
(global-set-key (kbd "C-x C-o") 'delete-window)

(global-set-key (kbd "C-b") 'switch-to-next-buffer)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "M-b") 'switch-to-prev-buffer)

(global-set-key (kbd "M-i") 'backward-kill-line)
(global-set-key (kbd "M-k") 'kill-line)
(global-set-key (kbd "M-l") 'delete-forward-char)
(global-set-key (kbd "M-j") 'delete-backward-char)
(global-set-key (kbd "M-S-i") 'previous-line)
(global-set-key (kbd "M-S-k") 'next-line)
(global-set-key (kbd "M-L") 'kill-word)
(global-set-key (kbd "M-J") 'backward-kill-word)

(global-set-key (kbd "C-s--") 'copy-region-as-kill)
(global-set-key (kbd "C-=") 'yank)
(local-set-key (kbd "C-s-=") 'yank-pop)
(global-set-key (kbd "C--") 'kill-line-or-region)
(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "M-q") 'keyboard-escape-quit)

(global-set-key (kbd "C-/") 'comment-or-uncomment-line-or-region)

(global-set-key (kbd "C-x C-,") 'kmacro-start-macro)
(global-set-key (kbd "C-x C-.") 'kmacro-end-macro)
(global-set-key (kbd "C-x C-/") 'kmacro-end-and-call-macro)

(global-set-key "\C-c i d"    'my-insert-date)
(global-set-key "\C-c i f" 'my-insert-file-name)
(global-set-key "\C-c n"    'cleanup-buffer)

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "C-i") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "C-j") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "C-i") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "C-k") 'next-line)
(define-key my-keys-minor-mode-map (kbd "C-l") 'forward-char)
(define-key my-keys-minor-mode-map (kbd "C-j") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "C-S-i") 'scroll-down)
(define-key my-keys-minor-mode-map (kbd "C-S-k") 'scroll-up)
(define-key my-keys-minor-mode-map (kbd "C-S-i") 'backward-paragraph)
(define-key my-keys-minor-mode-map (kbd "C-S-k") 'forward-paragraph)
(define-key my-keys-minor-mode-map (kbd "C-S-l") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "C-S-j") 'backward-word)

(define-key my-keys-minor-mode-map (kbd "M-d") 'other-window)
(define-key my-keys-minor-mode-map (kbd "C-o") 'split-window-right)
(define-key my-keys-minor-mode-map (kbd "C-S-o") 'split-window-below)
(define-key my-keys-minor-mode-map (kbd "C-x C-o") 'delete-window)

(define-key my-keys-minor-mode-map (kbd "C-b") 'switch-to-next-buffer)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'switch-to-buffer)

;;killing
(define-key my-keys-minor-mode-map (kbd "M-i") 'backward-kill-line)
(define-key my-keys-minor-mode-map (kbd "M-k") 'kill-line)
(define-key my-keys-minor-mode-map (kbd "M-l") 'delete-forward-char)
(define-key my-keys-minor-mode-map (kbd "M-j") 'delete-backward-char)
(define-key my-keys-minor-mode-map (kbd "M-S-i") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "M-S-k") 'next-line)
(define-key my-keys-minor-mode-map (kbd "M-S-l") 'kill-word)
(define-key my-keys-minor-mode-map (kbd "M-S-j") 'backward-kill-word)

;; copy,cut,paste,undo
(define-key my-keys-minor-mode-map (kbd "C-s--") 'copy-region-as-kill)
(define-key my-keys-minor-mode-map (kbd "C-=") 'yank)
(define-key my-keys-minor-mode-map (kbd "C-s-=") 'yank-pop)
(define-key my-keys-minor-mode-map (kbd "C--") 'kill-line-or-region)
(define-key my-keys-minor-mode-map (kbd "C-z") 'undo)

;;keyboard quit
(define-key my-keys-minor-mode-map (kbd "M-q") 'keyboard-escape-quit)

;;commenting
(define-key my-keys-minor-mode-map (kbd "C-/") 'comment-or-uncomment-line-or-region)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

;;;;;;;;;on startup;;;;;;;;
(my-keys-minor-mode 1)

;;;;;;;;everything else ;;;;;;;

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)


(defun my-erc-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'erc-mode-hook 'my-erc-setup-hook)

(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)

(electric-indent-mode 1)

;;dont have to use "yes" or "no" instead use "y" or "n"
(defalias 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; emacs autocomplete with tab;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(setq eshell-cmpl-cycle-completions nil)

;;tab key fix
(setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))

(smartparens-global-mode 1)

(add-hook 'after-init-hook 'global-flycheck-mode)

(defun my-python-send-region (&optional beg end)
  (interactive)
  (let ((beg (cond (beg beg)
                   ((region-active-p)
                    (region-beginning))
                   (t (line-beginning-position))))
        (end (cond (end end)
                   ((region-active-p)
                    (copy-marker (region-end)))
                   (t (line-end-position)))))
    (py-execute-region-ipython-no-switch beg end)))

(use-package python-mode 
:config 
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(defun python-override-keys ()
(local-set-key (kbd "C-c C-c") 'my-python-send-region)
(local-set-key (kbd "C-c C-s") 'py-execute-buffer-ipython-no-switch)
(local-set-key (kbd "M-RET") 'py-newline-and-indent)

(local-set-key (kbd "M-o") 'py-shift-right)
(local-set-key (kbd "M-u") 'py-shift-left)
)

(add-hook 'python-mode-hook 'python-override-keys)
(add-hook 'py-ipython-shell-mode-hook 'python-override-keys)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 
(setq jedi:get-in-function-call-delay 500)
(setq jedi:get-in-function-call-timeout 1000)

(use-package org
:bind("C-c a". org-agenda)
:config
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"))
(add-hook 'org-mode-hook (lambda () (modify-syntax-entry (string-to-char "\u25bc") "w"))) ; Down arrow for collapsed drawer.
(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-odd-level-only nil) 
(setq org-insert-heading-respect-content nil)
(setq org-M-RET-may-split-line '((item) (default . t)))
(setq org-special-ctrl-a/e t)
(setq org-return-follows-link nil)
(setq org-use-speed-commands t)
(setq org-startup-align-all-tables nil)
(setq org-log-into-drawer nil)
(setq org-tags-column 1)
(setq org-ellipsis " \u25bc" )
(setq org-speed-commands-user nil)
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
(setq org-completion-use-ido t)
(setq org-indent-mode t)
(setq org-startup-truncated nil)
(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)
(global-auto-revert-mode t)
(prefer-coding-system 'utf-8)
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode nil)               ;; No region when it is not highlighted
;; (setq cua-keep-region-after-copy t) 
)



(defun org-override-keys ()
(local-set-key (kbd "C-/") 'comment-or-uncomment-line-or-region)
(local-set-key (kbd "M-u") 'org-metaleft)
(local-set-key (kbd "M-o") 'org-metaright)
)

(add-hook 'org-mode-hook 'org-override-keys)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(use-package key-chord
:ensure t
:config
(key-chord-mode 1)
(key-chord-define-global "o0" 'find-file)
(key-chord-define-global "w2" 'ipython)
)

(use-package arduino-mode)

(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("/home/nick/my_zotero.bib"))

(add-hook 'TeX-mode-hook 'zotelo-minor-mode)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(use-package auto-complete-config
:config
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default))


(use-package yasnippet
:ensure t
:config
(yas-global-mode 1)

(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-x C-y") 'yas-expand)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>"))
