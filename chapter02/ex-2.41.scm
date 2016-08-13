(define (ordered-triples-that-sum-to-s n s)
  (filter (lambda (x) (sum-to-s? x s))
          (unique-triples n)))
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq)
                                     (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
(define (sum-to-s? x s)
  (= (+ (list-ref x 0)
        (list-ref x 1)
        (list-ref x 2))
     s))
(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval 1 (- j 1))))
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