;;; package --- Summary

;;; Commentary:

;;; Code:

(defun my-insert-pdb-break ()
  "insert a pdb.set_trace() at point"
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (insert-string "pdb.set_trace()")
  (py-indent-line-outmost)
  )

(defun my-insert-import-pdb()
  "insert import pdb at top if not already there"
  (interactive)
  (goto-char(point-max))
  (if (search-backward "import pdb" nil t)
      ()
    (if (re-search-backward "#!.*python.*" nil t)
        (progn
         (end-of-line)
         (newline)
         (insert-string "import pdb")
         (py-indent-line-outmost)
         )

      (goto-char(point-min))
      (newline)
      (previous-line)
      (insert-string "import pdb")
      (py-indent-line-outmost))
    )

  )

(defun my-insert-pdb-import-and-break()
  "imports pdb (if needed) and sets pdb break"
  (interactive)
  (save-excursion
    (my-insert-pdb-break)
    (my-insert-import-pdb)
    )
  )

(defun my-pdb-cleanup()
  "deletes any import pdb and pdb.set_trace()"
  (interactive)
  (save-excursion
    (goto-char(point-max))
    (while
        (search-backward "pdb.set_trace()" nil t)
      (beginning-of-line)
      (kill-line 1))
    (search-backward "import pdb" nil t)
    (beginning-of-line)
    (kill-line 1)
    )
  )


(provide 'pdb_emacs)
;;; pdb_emacs.el ends here
