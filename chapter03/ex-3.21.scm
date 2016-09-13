;; Since a queue is represented as a pair of the front pointer and the rear pointer, the standard Lisp interpreter merely prints the pair of the two pointers when given a queue, rather than the contents of the queue.

(define (print-queue q)
  (define (queue->list cur-ptr)
    (cond ((null? cur-ptr) '())
	  ((eq? cur-ptr (rear-ptr q)) (cons (car cur-ptr) '()))
	  (else (cons (car cur-ptr) (queue->list (cdr cur-ptr))))))
  (display (queue->list (front-ptr q))))
