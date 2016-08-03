(define (search-for-primes l r)
  (cond ((> l r) (newline))
        ((even? l) (search-for-primes (+ l 1) r))
        (else (timed-prime-test l)
              (search-for-primes (+ l 2) r))))
(define (even? x)
  (= (remainder x 2) 0))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (prime? n)
  (= (smallest-divisor n 2) n))
(define (smallest-divisor n k)
  (cond ((> (square k) n) n)
        ((divides? k n) k)
        (else (smallest-divisor n (+ k 1)))))
(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; The three smallest primes larger than 1000 is 1009 (10ms), 1013 (10ms) and 1019 (10ms).
;; The three smallest primes larger than 10,000 is 10,007 (33ms), 10,009 (32ms) and 10,037 (33ms).
;; The three smallest primes larger than 100,000 is 100,003 (107ms), 100,019 (106ms) and 100, 043 (107ms).
;; The three smallest primes larger than 1,000,000 is 1,000,003 (291ms), 1,000,033 (291ms) and 1,000,039 (291ms).
;;
;; The timing data shows that testing for primes around 10,000 takes about sqrt 10 times as long as testing for primes around 1000, and
;; that testing for primes around 1,000,000 takes about sqrt 10 times as long as testing for primes around 100,000.
