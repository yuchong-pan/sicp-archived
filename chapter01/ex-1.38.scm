(define (cont-frac n d k)
  (define (iter n d k dominator)
    (if (= k 1)
        (/ (n 1) dominator)
        (iter n
              d
              (- k 1)
              (+ (d (- k 1))
                 (/ (n k) dominator)))))
  (iter n d k (d k)))
(define e
  (+ 2 (cont-frac (lambda (i) 1.)
                  (lambda (i)
                    (if (= (remainder i 3) 2)
                        (* 2 (+ 1 (quotient i 3)))
                        1))
                  100)))
