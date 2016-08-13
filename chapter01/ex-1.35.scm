;; Let f(x) = 1+1/x. Then, f(ɸ) = 1+1/ɸ = 1+1/((1+sqrt(5))/2) = 1+2/(1+sqrt(5)) = 1+2(1-sqrt(5))/((1+sqrt(5))(1-sqrt(5))) =
;; 1+2(1-sqrt(5))/(-4) = 1+(sqrt(5)-1)/2 = (1+sqrt(5))/2 = ɸ. Hence, ɸ is a fixed point of the transformation x -> 1+1/x.

(define tolerance .000001)
(define (fixed-point f x)
  (let ((next (f x)))
    (if ((lambda (a b)
           (< (abs (- a b)) tolerance))
         x
         next)
        next
        (fixed-point f next))))
(define phi
  (fixed-point (lambda (x)
                 (+ 1 (/ 1 x)))
               1.))
