(define (averager a b c)
  (let ((sum (make-connector))
        (two (make-connector)))
    (adder a b sum)
    (multiplier two c sum)
    (constant 2 two)))