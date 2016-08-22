(define (apply-generic op . args)
  (define (convert-to to-type)
    (lambda (x)
      (let ((coercion (get-coercion (type-tag x) to-type)))
        (if coercion
            (coercion x)
            #f))))
  (define (try current)
    (if (null? current)
        (error "No method for these types" (list op args))
        (let ((converted-args (map (convert-to (type-tag (car current))) args)))
          (if (memq #f converted-args)
              (try (cdr current))
              (apply-generic op converted-args)))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (try args)))))

;; Suppose we have a tower of types as follows:
;;
;; complex
;;    ^
;;    |
;;  real
;;    ^
;;    |
;; rational
;;    ^
;;    |
;; integer
;;    ^
;;    |
;; natural
;;
;; Assume that we have defined a procedure exp for exponentiation specified by a complex number and an integer. If we call exp with a
;; complex number and a natural, apply-generic will first try to convert the complex number to a natural number, whereas this does not
;; work for an arbitrary complex number. Then, apply-generic will try to convert the natural number to a complex number. The conversion
;; works, but there is no operation exp specified by two complex numbers. Actually, however, a natural number can be converted to an
;; integer and then the interpreter can apply exp to a complex number and an integer.
