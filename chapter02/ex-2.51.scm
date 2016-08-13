#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; The first way:
(define (below p1 p2)
  (let ((top ((transform-painter (make-vect 0. .5)
                                 (make-vect 1. .5)
                                 (make-vect 0. 1.))
              p2))
        (bottom ((transform-painter (make-vect 0. 0.)
                                    (make-vect 1. 0.)
                                    (make-vect 0. .5))
                 p1)))
    (lambda (frame)
      (top frame)
      (bottom frame))))

;; The second way:
(define (below p1 p2)
  (let ((left (rotate90 p2))
        (right (rotate90 p1)))
    (let ((rotated (beside left right)))
      (rotate270 rotated))))
