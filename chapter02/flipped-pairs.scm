#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define (flipped-pairs painter)
  (let ((half (beside painter
                      (flip-vert painter))))
    (below half half)))
