;; a. The deriv procedure is transformed into data-directed style; i.e., deriv is implemented for each type of expression, distinguished
;;    by its operator. Since we distinguish whether an expression is a number with the primitive predicate number? and whether an
;;    expression is a variable with the primitive predicate eq? rather than the operator, i.e. the first element of the list, then we
;;    cannot assimilate the predicates numbers and same-variable? into the data-directed dispatch.

(put 'deriv '+ (lambda (items var)
                 (make-sum (deriv (car items) var)
                           (deriv (cadr items) var))))
(put 'deriv '* (lambda (items var)
                 (let ((x (car items))
                       (y (cadr items)))
                   (make-sum (make-product x (deriv y var))
                             (make-product y (deriv x var))))))
(put 'deriv '** (lambda (items var)
                  (let ((x (car items))
                        (y (cadr items)))
                    (make-product (make-product y (make-exponentiation x (- y 1)))
                                  (deriv x var)))))

;; d. All the put expressions should be transformed to (put <type> 'deriv <item>). For example, the procedure for derivatives of sums
;;    should be written as (put '+ 'deriv ...).
