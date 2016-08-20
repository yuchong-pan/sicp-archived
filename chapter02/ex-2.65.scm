(define (union-set set1 set2)
  (list->tree (union-ordered-lists (tree->list set1)
                                   (tree->list set2))))
(define (intersection-set set1 set2)
  (list->tree (intersection-ordered-lists (tree->list set1)
                                          (tree->list set2))))

(define (union-ordered-lists list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else (let ((x1 (car list1))
                    (x2 (car list2)))
                (cond ((= x1 x2) (cons x1
                                       (union-ordered-lists (cdr list1)
                                                            (cdr list2))))
                      ((< x1 x2) (cons x1
                                       (union-ordered-lists (cdr list1)
                                                            list2)))
                      ((> x1 x2) (cons x2
                                       (union-ordered-lists list1
                                                            (cdr list2)))))))))
(define (intersection-ordered-lists list1 list2)
  (cond ((or (null? list1)
             (null? list2))
         '())
        (else (let ((x1 (car list1))
                    (x2 (car list2)))
                (cond ((= x1 x2) (cons x1
                                       (intersection-ordered-lists (cdr list1)
                                                                   (cdr list2))))
                      ((< x1 x2) (intersection-ordered-lists (cdr list1)
                                                             list2))
                      ((> x1 x2) (intersection-ordered-lists list1
                                                             (cdr list2))))))))

(define (list->tree items)
  (car (partial-tree items (length items))))
(define (partial-tree items n)
  (if (= n 0)
      (cons '() items)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree items left-size)))
          (let ((left-subtree (car left-result))
                (mid-right-items (cdr left-result)))
            (let ((entry (car mid-right-items))
                  (right-items (cdr mid-right-items))
                  (right-size (- n left-size 1)))
              (let ((right-result (partial-tree right-items right-size)))
                (let ((right-subtree (car right-result))
                      (remaining-items (cdr right-result)))
                  (cons (make-tree entry left-subtree right-subtree)
                        remaining-items)))))))))

(define (tree->list tree)
  (if (null? tree)
      '()
      (append (tree->list (left-branch tree))
              (cons (entry tree)
                    (tree->list (right-branch tree))))))

(define (make-tree entry left right)
  (list entry left right))
(define (entry tree)
  (car tree))
(define (left-branch tree)
  (cadr tree))
(define (right-branch tree)
  (caddr tree))