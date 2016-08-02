(define (count-change a)
  (define (domination n)
    (cond ((= n 1) 1)
          ((= n 2) 5)
          ((= n 3) 10)
          ((= n 4) 25)
          ((= n 5) 50)))
  (define (cc a n)
    (cond ((= a 0) 1)
          ((or (< a 0) (= n 0)) 0)
          (else (+ (cc a (- n 1))
                   (cc (- a (domination n)) n)))))
  (cc a 5))
