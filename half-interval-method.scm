(define (half-interval-method f a b)
  (define (search f negative-point positive-point)
    (let ((midpoint
           ((lambda (a b)
              (/ (+ a b) 2))
            negative-point
            positive-point)))
      (if ((lambda (a b)
             (< (abs (- a b)) .001))
           negative-point
           positive-point)
          midpoint
          (let ((mid-value (f midpoint)))
            (cond ((positive? mid-value) (search f negative-point midpoint))
                  ((negative? mid-value) (search f midpoint positive-point))
                  (else midpoint))))))
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
          ((and (negative? b-value) (positive? a-value)) (search f b a))
          (else (error "Values are not of opposite sign" a b)))))
