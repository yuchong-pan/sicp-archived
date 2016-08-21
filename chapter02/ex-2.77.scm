;; Originally, no method is specified by the operator 'magnitude and the type 'complex; rather, there is only two method specified by the
;; operator 'magnitude and the types '(rectangular) and '(polar). Alyssa's modification installs a method specified by the operator
;; 'magnitude and the type '(complex). Hence, when Louis calls (magnitude z) where z's type is complex, there is a method specified by
;; 'magnitude and '(complex) in the data-directed system.
;;
;; (magnitude z)
;; (apply-generic 'magnitude z)
;; (map type-tag (list z)) => '(complex)
;; (get 'magnitude '(complex)) => (lambda (x)
;;                                  (apply-generic 'magnitude x))
;; (map contents (list z)) => (list (cons 'rectangular (cons 3 4)))
;; (apply (lambda (x)
;;          (apply-generic 'magnitude x))
;;        (list (cons 'rectangular (cons 3 4))))
;; (apply-generic 'magnitude (cons 'rectangular (cons 3 4)))
;; (map type-tag (list (cons 'rectangular (cons 3 4)))) => '(rectangular)
;; (get 'magnitude '(rectangular)) => (lambda (x)
;;                                      (sqrt (+ (square (real-part x))
;;                                               (square (imag-part x)))))
;; (map contents (list (cons 'rectangular (cons 3 4)))) => (list (cons 3 4))
;; (apply (lambda (x)
;;          (sqrt (+ (square (real-part x))
;;                   (square (imag-part x)))))
;;        (list (cons 3 4)))
;; (sqrt (+ (square (real-part (cons 3 4)))
;;          (square (imag-part (cons 3 4))))))
;; (real-part (cons 3 4)) => (car (cons 3 4)) => 3
;; (imag-part (cons 3 4)) => (cdr (cons 3 4)) => 4
;; (sqrt (+ (square 3) (square 4))) => 5
;;
;; Apply-generic is invoked twice, and (lambda (x) (apply-generic 'magnitude x)) and real-part-rectangular are dispatched to in each case,
;; respectively.
