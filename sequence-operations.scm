(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(define (sum-odd-squares sequence)
  (accumulate +
              0
              (map (lambda (x) (* x x))
                   (filter odd? sequence))))
(define (even-fibs n)
  (accumulate cons
              nil
              (filter even?
                      (map fib (enumerate-interval 0 n)))))
(define (fib n)
  (if (or (= n 0) (= n 1))
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))
(define (list-fib-squares n)
  (accumulate cons
              nil
              (map (lambda (x) (* x x))
                   (map fib (enumerate-interval 0 n)))))
(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
              1
              (map (lambda (x) (* x x))
                   (filter odd? sequence))))
