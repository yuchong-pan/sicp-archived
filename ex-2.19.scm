(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

;; The order of the list coin-values does not affect the answer produced by cc, since the first denomination to be used can be any
;; denomination remaining in the list coin-values, and since in any order, every denomination will be considered once and only once.
