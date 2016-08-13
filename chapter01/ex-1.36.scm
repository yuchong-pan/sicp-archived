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
(define (good-enough? a b)
  (< (abs (- a b)) tolerance))
(define (average a b)
  (/ (+ a b) 2))
(fixed-point (lambda (x)
               (/ (log 1000) (log x)))
             2.
             1)
(fixed-point (lambda (x)
               (average x (/ (log 1000) (log x))))
             2.
             1)

;; The fixed-point procedure without average damping takes 41 steps to find a solution to x^x=1000, and that with average damping take 12
;; steps to find a solution to x^x=1000.
