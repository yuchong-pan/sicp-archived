(define (make-rectangle segment1 segment2)
  (cons segment1 segment2))
(define (segment1-rectangle rect)
  (car rect))
(define (segment2-rectangle rect)
  (cdr rect))

(define (perimeter-rectangle rect)
  (* 2 (+ (length-segment (segment1-rectangle rect))
          (length-segment (segment2-rectangle rect)))))
(define (area-rectangle rect)
  (* (length-segment (segment1-rectangle rect))
     (length-segment (segment2-rectangle rect))))

(define (length-segment segment)
  (length-points (start-segment segment)
                 (end-segment segment)))
(define (length-points p1 p2)
  (sqrt (+ (square (- (x-point p1)
                      (x-point p2)))
           (square (- (y-point p1)
                      (y-point p2))))))

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (square x)
  (* x x))

;; Here is another representation for rectangles.
(define (make-rectangle-2 p0 p1 p2)
  (cons p0 (cons p1 p2)))
(define (segment1-rectangle-2)
  (make-segment p0 p1))
(define (segmeng2-rectangle-2)
  (make-segment p0 p2))

;; Data-abstraction barriers:
;;
;; -------- Programs that use rectangles -------
;;          Rectangles in problem domain
;; ----- parameter-rectangle area-rectangle ----
;;           Rectangles as two segments
;; --- segment1-rectangle segment2-rectangle ---
;;              Rectangles as pairs
;; ---------------- cons car cdr ---------------
;;         However pairs are implemented
