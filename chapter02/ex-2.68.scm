(define (encode info tree)
  (if (null? info)
      '()
      (append (encode-symbol (car info) tree)
              (encode (cdr info) tree))))

(define (encode-symbol symbol tree)
  (define (dfs symbol cur)
    (if (leaf? cur)
        '()
        (let ((left (left-branch cur))
              (right (right-branch cur)))
          (let ((left-symbols (symbols left))
                (right-symbols (symbols right)))
            (if (element-of-set? symbol left-symbols)
                (cons 0
                      (dfs symbol left))
                (cons 1
                      (dfs symbol right)))))))
  (if (not (element-of-set? symbol (symbols tree)))
      (error "symbol is not in the tree -- ENCODE-SYMBOL" symbol tree)
      (dfs symbol tree)))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((eq? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (leaf? tree)
  (eq? (car tree) 'leaf))
(define (left-branch tree)
  (car tree))
(define (right-branch tree)
  (cadr tree))
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

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-info
  '(A D A B B C A))
