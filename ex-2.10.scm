(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "The divisor interval spans 0." y)
      (mul-interval x
                    (make-interval (/ 1. (upper-bound y))
                                   (/ 1. (lower-bound y))))))
