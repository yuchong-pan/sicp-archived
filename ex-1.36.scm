(define tolerance .000001)
(define (fixed-point f x step)
  (display x)
  (display " *** ")
  (display step)
  (newline)
  (let ((next (f x)))
    (if (good-enough? x next)
        next
        (fixed-point f next (+ step 1)))))
(define (fixed-point-with-average-damping f x step)
  (display x)
  (display " *** ")
  (display step)
  (newline)
  (let ((next (f x)))
    (if (good-enough? x next)
        next
        (fixed-point-with-average-damping f ((lambda (a b)
                                               (/ (+ a b) 2))
                                             x
                                             next)
                                             (+ step 1)))))
(define (good-enough? a b)
  (< (abs (- a b)) tolerance))
(fixed-point (lambda (x)
               (/ (log 1000) (log x)))
             2.
             1)
(fixed-point-with-average-damping (lambda (x)
                                    (/ (log 1000) (log x)))
                                  2.
                                  1)

;; The fixed-point procedure without average damping takes 41 steps to find a solution to x^x=1000, and that with average damping take 12
;; steps to find a solution to x^x=1000.
