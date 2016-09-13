(define (count-pairs x)
  (define dfs
    (let ((visited '()))
      (lambda (x)
	(if (or (not (pair? x))
		(memq x visited))
	    0
	    (begin (set! visited (cons x visited))
		   (+ (dfs (car x))
		      (dfs (cdr x))
		      1))))))
  (dfs x))
