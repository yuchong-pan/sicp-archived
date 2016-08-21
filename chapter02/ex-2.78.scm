(define (type-tag x)
  (if (number? x)
      'scheme-number
      (car x)))
(define (contents x)
  (if (number? x)
      x
      (cdr x)))
(define (attach-tag type-tag x)
  (if (eq? type-tag 'scheme-number)
      x
      (cons type-tag x)))
