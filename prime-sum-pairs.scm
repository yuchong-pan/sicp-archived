(define (prime-sum-pairs n)
  (map (lambda (x)
         (let ((a (car x))
               (b (cadr x)))
           (list a b (+ a b))))
       (filter (lambda (x)
                 (prime? (+ (car x) (cadr x))))
               (flatmap (lambda (i)
                          (map (lambda (j)
                                 (list i j))
                               (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence)
                                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append
              nil
              (map proc seq)))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (prime? n)
  (define (smallest-divisor n k)
    (cond ((> (square k) n) n)
          ((divides? k n) k)
          (else (smallest-divisor n (+ k 1)))))
  (= (smallest-divisor n 2) n))
(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
