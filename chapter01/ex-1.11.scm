(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (* 2 (f-recursive (- n 2)))
                 (* 3 (f-recursive (- n 3)))))))

(define (f-iterative n)
  (define (f-iter a b c n)
    (if (= n 0)
        a
        (f-iter b
                c
                (+ c (* 2 b) (* 3 a))
                (- n 1))))
  (f-iter 0 1 2 n))
