#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                             (vector-sub (m corner1)
                                         new-origin)
                             (vector-sub (m corner2)
                                         new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0. 1.)
                     (make-vect 1. 1.)
                     (make-vect 0. 0.)))

(define (shrink-to-upper-right painter)
  (transform-painter painter
                     (make-vect .5 .5)
                     (make-vect 1. .5)
                     (make-vect .5 1.)))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1. 0.)
                     (make-vect 1. 1.)
                     (make-vect 0. 0.)))

(define (squash-inward painter)
  (transform-painter painter
                     (make-vect 0. 0.)
                     (make-vect .6 .4)
                     (make-vect .4 .6)))

(define (beside p1 p2)
  (let ((left (transform-painter p1
                                 (make-vect 0. 0.)
                                 (make-vect .5 0.)
                                 (make-vect 0. 1.)))
        (right (transform-painter p2
                                  (make-vect .5 0.)
                                  (make-vect 1. 0.)
                                  (make-vect .5 1.))))
    (lambda (frame)
      (left frame)
      (right frame))))
