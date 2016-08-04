(define (cont-frac n d k)
  (define (iter n d k dominator)
    (cond ((= k 1) (/ (n k) dominator))
          (else (iter n
                      d
                      (- k 1)
                      (+ (d (- k 1))
                         (/ (n k) dominator))))))
  (iter n d k (d k)))
(define actual-reciprocal-phi
  (/ 2 (+ 1 (sqrt 5))))
(define approximate-reciprocal-phi
  (cont-frac (lambda (i) 1.)
             (lambda (i) 1.)
             12))
actual-reciprocal-phi
approximate-reciprocal-phi

;; K must be at least 12 to get an approximation that is accurate to 4 decimal places.
