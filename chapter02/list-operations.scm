(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define (length items)
  (if (null? items)
      0
      (+ (length (cdr items)) 1)))
(define (append seq1 seq2)
  (if (null? seq1)
      seq2
      (cons (car seq1) (append (cdr seq1) seq2))))
