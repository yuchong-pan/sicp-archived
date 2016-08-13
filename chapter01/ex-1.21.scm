(define (smallest-divisor n)
  (define (square x)
    (* x x))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (try-iter n k)
    (cond ((> (square k) n) n)
          ((divides? k n) k)
          (else (try-iter n (+ k 1)))))
  (try-iter n 2))

;; The smallest divisors of 199, 1999 and 19999 are 199, 1999 and 7, respectively.
