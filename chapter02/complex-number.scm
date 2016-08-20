(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
                       (+ (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
                       (- (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))

;; rectangular form

(define (real-part z)
  (car z))
(define (imag-part z)
  (cdr z))
(define (magnitude z)
  (sqrt (+ (square (real-part z))
           (square (imag-part z)))))
(define (angle z)
  (atan (image-part z) (real-part z)))
(define (make-from-real-imag real imag)
  (cons real imag))
(define (make-from-mag-ang mag ang)
  (cons (* mag (cos ang))
        (* mag (sin ang))))

;; polar form

(define (magnitude z)
  (car z))
(define (angle z)
  (cdr z))
(define (real-part z)
  (* (magnitude z) (cos (angle z))))
(define (imag-part z)
  (* (magnitude z) (sin (angle z))))
(define (make-from-mag-ang mag ang)
  (cons mag ang))
(define (make-from-real-imag real imag)
  (cons (sqrt (+ (square real)
                 (square imag)))
        (atan imag real)))

(define (square x) (* x x))