(define (make-accumulator amount)
  (define (dispatch delta)
    (set! amount (+ amount delta))
    amount)
  dispatch)
