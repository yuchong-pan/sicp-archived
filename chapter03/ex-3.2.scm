(define (make-monitored f)
  (define counter 0)
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls?) counter)
          ((eq? m 'reset-count) (set! counter 0))
          (else (set! counter (+ counter 1))
                (f m))))
  dispatch)
