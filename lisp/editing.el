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
;; (global-set-key "\C-C" 'copy-region-as-kill)
;; (global-set-key (kbd "C-=") 'yank)
  ;; (global-set-key (kbd "C-s-=") 'yank-pop)
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
(electric-indent-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; emacs autocomplete with tab;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(setq eshell-cmpl-cycle-completions nil)
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(show-paren-mode t)
