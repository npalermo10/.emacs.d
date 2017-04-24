(defun start_arduino_project ()
  "Prompt user for project name, creates directory and file."
  (interactive)
  (let ((d (read-file-name "Project directory:")))
    (unless (file-exists-p d)
      (make-directory d)
      (find-file (concat (file-name-as-directory d) (file-name-nondirectory d) ".ino"))
      (insert "void setup() {
  Serial.begin(9600);
  
}
void loop() {
  
}" )
      (goto-char (point-min))
      (newline)
      (newline)
      (goto-char (point-min))
      (save-buffer))))
