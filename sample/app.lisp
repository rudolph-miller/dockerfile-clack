(defpackage sample.app
  (:use :cl
        :lack))
(in-package :sample.app)

(builder
 (lambda (env)
   (declare (ignore env))
   '(200 (:content-type "text/plain") ("Hello, World"))))
