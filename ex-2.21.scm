(define (square-list items)
  (if (null? items)
      nil
      (cons ((lambda (x) (* x x))
             (car items))
            (square-list (cdr items)))))
(define (square-list items)
  (map (lambda (x) (* x x))
       items))
