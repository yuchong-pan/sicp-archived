(define (double f)
  (lambda (x)
    (f (f x))))

;; The value returned by (((double (double double)) inc) 5) is 21.
