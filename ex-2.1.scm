(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((new-n (/ n g))
          (new-d (/ d g)))
      (if (>= (* new-n new-d) 0)
          (cons (abs new-n) (abs new-d))
          (cons (- (abs new-n)) (abs new-d))))))
