#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))
