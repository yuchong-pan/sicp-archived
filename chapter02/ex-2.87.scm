;; to be added into the polynomial package
(put '=zero? '(polynomial) (lambda (x) (empty-termlist? x)))

;; to be added into the scheme-number package
(put '=zero? '(scheme-number) (lambda (x) (= x 0)))

(define (=zero? x)
  (apply-generic '=zero? x))
