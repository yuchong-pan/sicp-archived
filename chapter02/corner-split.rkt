#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (below (beside painter
                       (below right right))
               (beside (beside up up)
                       (corner-split painter (- n 1)))))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter
               (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((up (beside (flip-horiz quarter)
                      quarter)))
      (below (flip-vert up)
             up))))
