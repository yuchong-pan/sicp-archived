;; a. If we call exp with two complex numbers as arguments, the interpreter will be stuck in an infinite recursion; i.e., the interpreter
;;    will constantly apply complex->complex and search the exp operation specified by two complex nummbers recursively.
;;
;; b. Apply-generic works correctly as is, since the interpreter cannot find complex->complex in the coercion table and will not be stuck
;;    in an infinite recursion as Louis does.

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args))
        (proc (get op type-tags)))
    (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
            (let ((type1 (type-tag (car args)))
                  (type2 (type-tag (cadr args))))
              (if (eq? type1 type2)
                  (error "No method for these types" (list op type-tags))
                  (let ((t1->t2 (get-coercion type1 type2))
                        (t2->t1 (get-coercion type2 type1))
                        (a1 (car args))
                        (a2 (cadr args)))
                    (cond (t1->t2 (apply-generic op (t1->t2 a1) a2))
                          (t2->t1 (apply-generic op a1 (t2->t1 a2)))
                          (else (error "No method for these types" (list op type-tags)))))))
            (error "No method for these types" (list op type-tags))))))
