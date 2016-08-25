;; to be added into the polynomial package
(define (negation-term term)
  (make-term (order term)
             (negation (coeff term))))
(define (negation-termlist terms)
  (map (lambda (term) (negation-term term)) terms))
(define (negation-poly p)
  (make-polynomial (variable p)
                   (negation-termlist (term-list p))))
(define (sub-poly p1 p2)
  (add-poly p1 (negation-poly p2)))
(put 'sub '(polynomial polynomial) (lambda (x y) (tag (sub-poly x y))))
(put 'negation '(polynomial) (lambda (x) (tag (negation-poly x))))

;; to be added into the scheme-number package
(put 'negation '(scheme-number) (lambda (x) (tag (- x))))
