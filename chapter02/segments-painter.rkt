#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (let ((frame-map (frame-coord-map frame)))
         (draw-line (frame-map (segment-start segment))
                    (frame-map (segment-end segment)))))
     segment-list)))
