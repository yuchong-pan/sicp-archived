(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (= (length set) 1)
      (car set)
      (let ((a (car set))
            (b (cadr set))
            (remaining (cddr set)))
        (successive-merge (adjoin-set (make-code-tree a b)
                                      remaining)))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

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

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))

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
(define (leaf? tree)
  (eq? (car tree) 'leaf))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x)
            (weight (car set)))
         (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((eq? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define huffman-tree
  (generate-huffman-tree '((A 2)
                           (BOOM 1)
                           (GET 2)
                           (JOB 2)
                           (NA 16)
                           (SHA 3)
                           (YIP 9)
                           (WAH 1))))

(define code
  (encode '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM)
          huffman-tree))

(display code)
(newline)
(display (length code))
(newline)

;; 84 bits are required for the encoding, while the smallest number of bits that would be needed to encode this song if we used a fixed-
;; length code for the eight-symbol alphabet is 36*3 = 108.
