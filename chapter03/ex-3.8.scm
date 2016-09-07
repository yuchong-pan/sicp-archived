(define f
  (let ((x 1))
    (lambda (y)
      (set! x (* x y))
      x)))
