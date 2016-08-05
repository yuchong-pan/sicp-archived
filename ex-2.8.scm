;; The minimum value the subtraction could be is the subtraction of the lower bound of the minuend and the upper bound of the subtrahend,
;; and the maximum value it could be is the subtraction of the upper bound of the minuend and the lower bound of the subtrahend.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
