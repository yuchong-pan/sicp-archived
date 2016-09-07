(define (factorial n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin (set! product (* product counter))
                 (set! counter (+ counter 1))
                 (iter))))
    (iter)))