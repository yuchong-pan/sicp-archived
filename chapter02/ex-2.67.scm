(define (decode bits tree)
  (define (decode-1 bits cur)
    (if (null? bits)
        '()
        (let ((next (choose-branch (car bits) cur)))
          (if (leaf? next)
              (cons (symbol-leaf next)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next)))))
  (decode-1 bits tree))

(define (choose-branch bit cur)
  (cond ((= bit 0) (left-branch cur))
        ((= bit 1) (right-branch cur))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (left-branch tree)
  (car tree))
(define (right-branch tree)
  (cadr tree))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

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

(define (leaf? tree)
  (eq? (car tree) 'leaf))

(define (symbol-leaf tree)
  (cadr tree))
(define (weight-leaf tree)
  (caddr tree))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;; The result is '(A D A B B C A).
