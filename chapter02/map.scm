(define (map proc items)
  (if (null? item)
      nil
      (cons (proc (car items)) (map proc (cdr items)))))
