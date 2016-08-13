;; For small numbers, the relative errors of the square roots we find using the good-enough? test will be quite large. For example, if the
;; tolerance and the number both equal 0.001, then any number between 0 and 0.0447 (the square root of 0.002) will be accepted as the
;; square root of the given number, whereas the actual square root is 0.0316. Although the absolute error is still within the tolerance,
;; the relative error is large. Hence, the good-enough? test is inadequate for small numbers.
;;
;; For large numbers, due to the limited precision for real number operations in real computers, even if the tolerance is added to the
;; given number, the tolerence may be ignored. Hence, the program may get stuck in an infinite recursion.

(define (sqrt x)
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (good-enough? y new-y x)
    (< (abs (- y new-y)) (* 0.000001 x)))
  (define (improve y x)
    (/ (+ y (/ x y)) 2))
  (define (sqrt-iter y x)
    (if (good-enough? y (improve y x) x)
        (improve y x)
        (sqrt-iter (improve y x) x)))
  (sqrt-iter 1.0 x))

;; This new version of the square-root procedure works better for small and large numbers, since we check the relative errors instead of
;; the absolute errors for the good-enough? test. This method can avoid the precision problem either for small numbers or for large
;; numbers.
