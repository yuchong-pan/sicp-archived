(define (fringe items)
  (cond ((not (pair? items)) (list items))
        ((null? (cdr items)) (fringe (car items)))
        (else (append (fringe (car items)) (fringe (cdr items))))))
