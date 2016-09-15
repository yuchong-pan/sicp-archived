(define (make-table) (list '*table))
(define (lookup key table)
  (let ((result (assoc key (cdr table))))
    (if result
	(cdr result)
	#f)))
(define (assoc key records)
  (cond ((null? records) #f)
	((eq? key (caar records)) (car records))
	(else (assoc key (cdr records)))))
(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table
		  (cons (cons key value) (cdr table)))))
  'ok)
