;; In order to accommodate complex numbers whose real parts, imaginary parts, magnitudes and angles can be either ordinary numbers,
;; rational numbers or other numbers we might wish to add to the system, the primitive operators +, -, *, /, sqrt, square, atan, sin and
;; cos should be substituted by the generic operators add, sub, mul, div, square-root, square, arc-tangent, sine and cosine.

;; to be included in the scheme-number package
(put 'square-root '(scheme-number) (lambda (x) (tag (sqrt x))))
(put 'arc-tangent '(scheme-number) (lambda (x) (tag (atan x))))
(put 'sine '(scheme-number) (lambda (x) (tag (sin x))))
(put 'cosine '(scheme-number) (lambda (x) (tag (cos x))))

;; to be included in the rational-number package
(put 'square-root '(rational) (lambda (x)
                                (tag (sqrt (/ (numer x) (denom x))))))
(put 'arc-tangent '(rational) (lambda (x)
                                (tag (atan (/ (numer x) (denom x))))))
(put 'sine '(rational) (lambda (x)
                         (tag (sin (/ (numer x) (denom x))))))
(put 'cosine '(rational) (lambda (x)
                           (tag (cos (/ (numer x) (denom x))))))

(define (square-root x)
  (apply-generic 'square-root x))
(define (arc-tangent x)
  (apply-generic 'arc-tangent x))
(define (sine x)
  (apply-generic 'sine x))
(define (cosine x)
  (apply-generic 'cosine x))
(define (square x)
  (mul x x))

;; to be included in the rectangular package substituting the original corresponding procedures
(define (magnitude x)
  (square-root (add (square (real-part x))
                    (square (imag-part x)))))
(define (angle x)
  (arc-tangent (imag-part x)
               (real-part x)))

;; to be included in the polar package substituting the original corresponding procedures
(define (real-part x)
  (mul (magnitude x)
       (cosine (angle x))))
(define (imag-part x)
  (mul (magnitude x)
       (sine (angle x))))
