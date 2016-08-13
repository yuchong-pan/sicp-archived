#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  ((square-of-four identity flip-vert
                   identity flip-vert)
   painter))

(define (square-limit painter n)
  ((square-of-four flip-horiz identity
                   rotate180 flip-vert)
   (corner-split painter n)))

(define (rotate180 painter)
  (flip-horiz (flip-vert painter)))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top (beside (beside up up)
                           (corner-split painter (- n 1))))
              (bottom (beside painter
                              (below right right))))
          (below bottom top)))))

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
