(define (make-table same-key? less-than-key?)
  (let ((local-table '()))
    (define (key-node tree) (car tree))
    (define (value-node tree) (cadr tree))
    (define (left-node tree) (caddr tree))
    (define (right-node tree) (cadddr tree))
    (define (set-value-node! tree item) (set-car! (cdr tree) item))
    (define (set-left-node! tree item) (set-car! (cddr tree) item))
    (define (set-right-node! tree item) (set-car! (cdddr tree) item))
    (define (lookup key)
      (define (lookup-tree key tree)
	(cond ((null? tree) false)
	      ((same-key? key (key-node tree)) (value-node tree))
	      ((less-than-key? key (key-node tree)) (lookup-tree key (left-node tree)))
	      (else (lookup-tree key (right-node tree)))))
      (lookup-tree key local-table))
    (define (insert! key value)
      (define (insert-tree! tree)
	(cond ((same-key? key (key-node tree))
	       (set-value-node! tree value))
	      ((less-than-key? key (key-node tree))
	       (if (null? (left-node tree))
		   (set-left-node! tree (list key value '() '()))
		   (insert-tree! (left-node tree))))
	      (else
	       (if (null? (right-node tree))
		   (set-right-node! tree (list key value '() '()))
		   (insert-tree! (right-node tree))))))
      (if (null? local-table)
	  (set! local-table (list key value '() '()))
	  (insert-tree! local-table)))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))
