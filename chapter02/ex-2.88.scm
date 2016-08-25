(define (install-negation-package)
  (put 'negation '(scheme-number) (lambda (x) (attach-tag 'scheme-number (- x))))
  (put 'negation '(polynomial) (lambda (x)
                                 (attach-tag 'polynomial
                                             (make-poly (variable x)
                                                        (map (lambda (term)
                                                               (make-term (order term)
                                                                          (negation (coeff term))))
                                                             (term-list x))))))
  'done)
(define (negation x) (apply-generic 'negation x))

;; to be added into the polynomial package
(define (sub-poly p1 p2)
  (add-poly p1 (negation p2)))
(put 'sub '(polynomial) (lambda (x y) (tag (sub x y))))
