(define (cube-root x)
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (improve y x)
    (/ (+ (/ x (* y y))
          (* 2 y))
       3))
  (define (good-enough? y x)
    (< (abs (- y (improve y x))) (* 0.000001 x)))
  (define (cube-root-iter y x)
    (if (good-enough? y x)
        y
        (cube-root-iter (improve y x) x)))
  (cube-root-iter 1.0 x))