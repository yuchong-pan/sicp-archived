(define (remainder-terms x y)
  (cadr (div-terms x y)))
(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

;; to be added into the polynomial package
(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- GCD-POLY" (list p1 p2))))
(put 'greatest-common-divisor '(polynomial polynomial) (lambda (x y) (tag (gcd-poly x y))))

;; to be added into the scheme-number package
(put 'greatest-common-divisor '(scheme-number scheme-number) (lambda (x y) (tag (gcd x y))))

(define (greatest-common-divisor x y)
  (apply-generic 'greatest-common-divisor x y))
