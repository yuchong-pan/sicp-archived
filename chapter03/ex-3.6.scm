(define rand
  (let ((x random-init))
    (lambda (argument)
      (cond ((eq? argument 'generate) (begin (set! x (rand-update x))
                                             x))
            ((eq? argument 'reset) (lambda (new-value)
                                     (set! x new-value)))
            (else (error "Wrong argument given -- RAND" argument))))))
