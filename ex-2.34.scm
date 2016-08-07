(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-term)
                (+ this-coeff
                   (* x higher-term)))
              0
              coefficient-sequence))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
