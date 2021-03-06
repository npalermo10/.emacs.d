;;; pdb_emacs.el --- Insert and remove pdb import and traces
                                        ; Package-Requires: ((python-mode))
;;; Commentary:

;;This package eases the use of pdb for python debugging by providing functions to quickly insert pdb.set_trace() and import pdb into your code.  Also provides a pdb cleanup function.

;;; Code:

(defun my-insert-pdb-break ()
  "Insert a pdb.set_trace() at point."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (insert "import pdb; pdb.set_trace()")
  (py-indent-line-outmost))

(defun my-insert-import-pdb()
  "insert import pdb at top if not already there"
  (interactive)
  (save-restriction
    (widen)
    (goto-char(point-min))
    (unless (search-forward "import pdb" nil t)
      (if (re-search-forward "#!.*python.*" nil t)
          (progn
            (end-of-line)
            (newline))
        (goto-char(point-min))
        (newline)
        (forward-line -1))
      (insert "import pdb")
      (py-indent-line-outmost))))

(defun my-insert-pdb-import-and-break()
  "imports pdb (if needed) and sets pdb break"
  (interactive)
  (save-excursion
    (my-insert-pdb-break)
    (my-insert-import-pdb)))

(defun my-pdb-cleanup()
  "deletes any import pdb and pdb.set_trace()"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char(point-min))
      (if (search-forward "import pdb; pdb.set_trace()" nil t)
          (progn
            (beginning-of-line)
            (kill-line 1)
            (goto-char(point-min)))
        ())
      )))


(defun pdb-pm ()
    "Import pdb and invoke pdb.pm() to debug most recent python error in python shell"
    (interactive)
    (insert "import pdb; pdb.pm()")
    (comint-send-input)
  )


(provide 'pdb_emacs.el)
;;; pdb_emacs.el ends here
