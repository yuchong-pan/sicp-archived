(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (number? a) (number? b)) (= a b))
        ((and (symbol? a) (symbol? b)) (eq? a b))
        ((and (pair? a) (pair? b)) (and (equal? (car a) (car b))
                                        (equal? (cdr a) (cdr b))))
        (else #f)))
