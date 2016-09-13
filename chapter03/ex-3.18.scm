(define (contain-cycle? x)
  (define dfs
    (let ((visited '()))
      (lambda (x)
	(cond ((not (pair? x)) #f)
	      ((memq x visited) #t)
	      (else (set! visited (cons x visited))
		    (dfs (cdr x)))))))
  (dfs x))
