(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum (make-product (multiplier exp)
                                                (deriv (multiplicand exp) var))
                                  (make-product (multiplicand exp)
                                                (deriv (multiplier exp) var))))
        (else (error "unknown expression type -- DERIV" exp))))

(define (variable? exp) (symbol? exp))
(define (same-variable? exp1 exp2)
  (and (symbol? exp1)
       (symbol? exp2)
       (eq? exp1 exp2)))

(define (sum? exp)
  (and (pair? exp)
       (= (length exp) 3)
       (eq? (cadr exp) '+)))
(define (product? exp)
  (and (pair? exp)
       (= (length exp) 3)
       (eq? (cadr exp) '*)))

(define (addend exp) (car exp))
(define (augend exp) (caddr exp))
(define (multiplier exp) (car exp))
(define (multiplicand exp) (caddr exp))

(define (make-sum exp1 exp2)
  (cond ((=number? exp1 0) exp2)
        ((=number? exp2 0) exp1)
        ((and (number? exp1) (number? exp2)) (+ exp1 exp2))
        (else (list exp1 '+ exp2))))
(define (make-product exp1 exp2)
  (cond ((or (=number? exp1 0) (=number? exp2 0)) 0)
        ((=number? exp1 1) exp2)
        ((=number? exp2 1) exp1)
        ((and (number? exp1) (number? exp2)) (* exp1 exp2))
        (else (list exp1 '* exp2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))
