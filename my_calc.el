(defun my-calc ()
  "Starts calc and trail in maximized buffers."
  (interactive)
  (calc)
  (switch-to-buffer "*Calculator*")
  (delete-other-windows)
  (split-window-right)
  (other-window 1)
  (switch-to-buffer "*Calc Trail*")
  (other-window -1)
  )
