(define tolerance .000001)
(define (fixed-point f x)
  (let ((next (f x)))
    (if ((lambda (a b)
          (< (abs (- a b)) tolerance))
         x
         next)
        next
        (fixed-point f next))))
(define (sqrt x)
  (fixed-point (lambda (y)
                 ((lambda (a b)
                    (/ (+ a b) 2))
                  y
                  (/ x y)))
               1.))
