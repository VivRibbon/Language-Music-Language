(setf source-text-one `"when i listened to anthony braxton and wrote down my conception of music language reapplied to language i reinvented language poetry ;;;;....?!'")


(defun break-text (source) (coerce source `list))

(defun random-from-range (start end)
  (+ start (random (+ 1 ( - end start)))))

(defun pull-character (num source)
  (nth num (break-text source)))

(defun create-jumble (loop-count jumble-source)
  (loop repeat loop-count
        collect (pull-character (random-from-range 1 (- (length jumble-source) 1)) jumble-source)))

(defun create-jumble-string (loop-count jumble-source)
  (coerce (create-jumble loop-count jumble-source) `string))

(defun make-line (line-length-min line-length-max jumble-source)
  (format t "~a~%" (create-jumble-string (random-from-range line-length-min line-length-max) jumble-source)))

(defun make-lines (line-count line-length-min line-length-max jumble-source)
  (loop repeat line-count
        do (make-line line-length-min line-length-max jumble-source)))
