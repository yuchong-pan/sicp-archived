;; to be added into the polynomial package
(define (add-poly p1 p2)
  (if (same-variable? (variable p1)
                      (variable p2))
      (make-poly (variable p1)
                 (add-terms (term-list p1)
                            (term-list p2)))
      (if (symbol<? p1 p2)
          (add-poly p1 (poly-convert p2 (variable p1)))
          (add-poly p2 (poly-convert p1 (variable p2))))))

(define (mul-poly p1 p2)
  (if (same-variable? (variable p1)
                      (variable p2))
      (make-poly (variable p1)
                 (mul-terms (term-list p1)
                            (term-list p2)))
      (if (symbol<? (variable p1) (variable p2))
          (mul-poly p1 (poly-convert p2 (variable p1)))
          (mul-poly p2 (poly-convert p1 (variable p2))))))

(define (symbol<? v1 v2)
  (string<? (symbol->strnig v1)
            (symbol->string v2)))

(define (poly-convert p v)
  (cond ((number? p) (make-poly v (adjoin-term (make-term 0 p)
                                               (the-empty-termlist))))
        ((same-variable? v (variable p)) p)
        (else (let ((new-coeff (poly-convert (coeff (first-term (term-list p))) v)))
                (let ((temp1 (make-poly (variable p) (adjoin-term (make-term (order (first-term (term-list p))) 1)
                                                                  (the-empty-termlist)))))
                  (let ((temp2 (make-poly v (adjoin-term (make-term 0 temp1)
                                                         (the-empty-termlist)))))
                    (add (mul temp2 new-coeff)
                         (poly-convert (make-poly (variable p) (rest-terms (term-list p))) v))))))))
