(asdf:defsystem cl-erlang-generator
    :version "0"
    :description "Emit Erlang code"
    :maintainer " <kielhorn.martin@gmail.com>"
    :author " <kielhorn.martin@gmail.com>"
    :licence "GPL"
    :depends-on ("alexandria" "cl-ppcre")
    :serial t
    :components ((:file "package")
		 (:file "erlang")) )
