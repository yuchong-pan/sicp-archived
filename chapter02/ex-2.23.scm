(define (for-each action items)
  (cond ((null? (cdr items)) (action (car items)))
        (else (action (car items))
              (for-each action (cdr items)))))
