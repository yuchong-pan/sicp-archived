;; (car (cons x y))
;; (car (lambda (m) (m x y)))
;; ((lambda (m) (m x y)) (lambda (p q) p))
;; ((lambda (p q) p) x y)
;; x
;; Hence, (car (cons x y)) yields x for any objects x and y.

(define (cdr z)
  (z (lambda (p q) q)))
