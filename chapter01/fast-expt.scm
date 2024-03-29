(define (fast-expt b n)
  (define (square x)
    (* x x))
  (define (even? x)
    (= (remainder x 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
