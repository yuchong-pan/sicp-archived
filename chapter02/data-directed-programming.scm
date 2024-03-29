(define (install-rectangular-package)
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (magnitude z) (sqrt (+ (square (real-part z))
                                 (square (imag-part z)))))
  (define (angle z) (atan (imag-part z)
                          (real-part z)))
  (define (make-from-real-imag real imag) (cons real imag))
  (define (make-from-mag-ang mag ang) (cons (* mag (cos ang))
                                      (* mag (sin ang))))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular (lambda (x y)
                                           (cons 'rectangular (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular (lambda (x y)
                                         (cons 'rectangular (make-from-mag-ang x y))))
  'done)

(define (install-polar-package)
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (real-part z) (* (magnitude z)
                           (cos (angle z))))
  (define (imag-part z) (* (magnitude z)
                           (sin (angle z))))
  (define (make-from-mag-ang mag ang) (cons mag ang))
  (define (make-from-real-imag real imag) (cons (sqrt (+ (square real))
                                                      (+ (square imag)))
                                                (atan imag real)))
  (put 'magnitude '(polar) magnitude)
  (put 'angle '(polar) angle)
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'make-from-mag-ang 'polar (lambda (x y)
                                   (cons 'polar (make-from-mag-ang x y))))
  (put 'make-from-real-imag 'polar (lambda (x y)
                                     (cons 'polar (make-from-real-imag x y))))
  'done)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error "No method for these types -- APPLY-GENERIC" (list op type-tags))))))

(define (real-part x) (apply-generic 'real-part x))
(define (imag-part x) (apply-generic 'imag-part x))
(define (magnitude x) (apply-generic 'magnitude x))
(define (angle x) (apply-generic 'angle x))

(define make-from-real-imag
  (get 'make-from-real-imag 'rectangular))
(define make-from-mag-ang
  (get 'make-from-mag-ang 'polar))

(define (square x) (* x x))
(define (type-tag z) (car z))
(define (contents z) (cdr z))
