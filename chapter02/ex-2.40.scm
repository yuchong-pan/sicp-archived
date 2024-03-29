(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
(define (flatmap proc seq)
  (accumulate append
              nil
              (map proc seq)))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (prime-sum-pairs n)
  (map make-pair-sums
       (filter prime-sum? (unique-pairs n))))
(define (make-pair-sums x)
  (let ((a (car x))
        (b (cadr x)))
    (list a b (+ a b))))
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq)
                                     (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
(define (prime-sum? x)
  (prime? (+ (car x) (cadr x))))
(define (prime? x)
  (define (smallest-divisor n k)
    (cond ((> (square k) n) n)
          ((divides? k n) k)
          (else (smallest-divisor n (+ k 1)))))
  (= (smallest-divisor x 2) x))
(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
