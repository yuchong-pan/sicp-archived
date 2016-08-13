#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define wave
  (lambda (frame)
    ((segments->painter (list (make-seg 0. 0. 0. 1.)
                              (make-seg 0. 0. 1. 0.)
                              (make-seg 0. 1. 1. 1.)
                              (make-seg 1. 0. 1. 1.)
                              (make-seg 0. .8 .15 .6)
                              (make-seg .15 .6 .3 .65)
                              (make-seg .3 .65 .4 .65)
                              (make-seg .4 .65 .35 .85)
                              (make-seg .35 .85 .4 1.)
                              (make-seg .6 1. .65 .85)
                              (make-seg .65 .85 .6 .65)
                              (make-seg .6 .65 .75 .65)
                              (make-seg .75 .65 1. .4)
                              (make-seg 1. .2 .6 .45)
                              (make-seg .6 .45 .75 0.)
                              (make-seg .6 0. .5 .3)
                              (make-seg .5 .3 .4 0.)
                              (make-seg .25 0. .35 .45)
                              (make-seg .35 .45 .25 .55)
                              (make-seg .25 .55 .15 .35)
                              (make-seg .15 .35 0. .6)
                              (make-seg .5 .7 .55 .75)
                              (make-seg .55 .75 .45 .75)
                              (make-seg .45 .75 .5 .7)))
     frame)))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (below (beside painter
                       right)
               (beside up
                       (corner-split painter (- n 1)))))))

(define (square-limit painter n)
  ((square-of-four flip-vert
                   flip-horiz
                   rotate90
                   rotate180)
   (corner-split painter n)))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br painter))))
      (below bottom top))))

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

(define (make-seg a b c d)
  (make-segment (make-vect a b)
                (make-vect c d)))
