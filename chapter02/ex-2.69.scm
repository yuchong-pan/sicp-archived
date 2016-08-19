(define (successive-merge set)
  (if (= (length set) 1)
      (car set)
      (let ((a (car set))
            (b (cadr set))
            (remaining (cddr set)))
        (successive-merge (adjoin-set (make-code-tree a b)
                                      remaining)))))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (symbol-leaf tree)
  (cadr tree))
(define (weight-leaf tree)
  (caddr tree))
(define (leaf? tree)
  (eq? (car tree) 'leaf))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x)
            (weight (car set)))
         (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
