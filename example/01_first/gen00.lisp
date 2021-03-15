(declaim (optimize (debug 3)
		   (speed 0)
		   (safety 3)))

(eval-when (:compile-toplevel :execute :load-toplevel)
  (ql:quickload "cl-erlang-generator")
  (ql:quickload "alexandria")
  (ql:quickload "cl-ppcre"))
(in-package :cl-erlang-generator)

(progn
  (defparameter *path* "/home/martin/stage/cl-erlang-generator/example/01_first")
  (defparameter *code-file* "run_00_start")
  (defparameter *source* (format nil "~a/source/~a" *path* *code-file*))
  (defparameter *day-names*
    '("Monday" "Tuesday" "Wednesday"
      "Thursday" "Friday" "Saturday"
      "Sunday"))
  (let* ((code
	  `(do0
	    (do0 (comments " comment")
		 #+nil (setf
	       code_git_version
		  (string ,(let ((str (with-output-to-string (s)
					(sb-ext:run-program "/usr/bin/git" (list "rev-parse" "HEAD") :output s))))
			     (subseq str 0 (1- (length str)))))
		  code_repository (string ,(format nil "https://github.com/plops/cl-elixir-generator/tree/master/example/01_first/source/run_00_start.py")
					   )

		  code_generation_time
		  (string ,(multiple-value-bind
				 (second minute hour date month year day-of-week dst-p tz)
			       (get-decoded-time)
			     (declare (ignorable dst-p))
		      (format nil "~2,'0d:~2,'0d:~2,'0d of ~a, ~d-~2,'0d-~2,'0d (GMT~@d)"
			      hour
			      minute
			      second
			      (nth day-of-week *day-names*)
			      year
			      month
			      date
			      (- tz)))))
		 ))))
     (write-source (format nil "~a/source/~a" *path* *code-file*) code)))

