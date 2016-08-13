;; For the first constructor:
(define (origin-frame frame)
  (list-ref frame 0))
(define (edge1-frame frame)
  (list-ref frame 1))
(define (edge2-frame frame)
  (list-ref frame 2))

;; For the second constructor:
(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (cddr frame))
