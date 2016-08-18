(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
(define (adjoin-set x set)
  (cons x set))
(define (union-set set1 set2)
  (if (null? set1)
      set2
      (adjoin (car set1)
              (union-set (cdr set1) set2))))
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) nil)
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; The number of steps required by element-of-set?, adjoin-set, union-set and intersection set for the duplicate representation is
;; Theta(n), Theta(1), Theta(n) and Theta(n^2), respectively. Hence, adjoin-set and union-set for the duplicate representation are more
;; efficient than the corresponding procedures for the non-duplicate representation, which require Theta(n) and Theta(n^2) steps,
;; respectively.
;;
;; If one needs to count the number of some value in the set, or if there are far more the adjoin-set and union-set operations than the
;; element-of-set? and intersection-set operations, the duplicate representation will be used in preference to the non-duplicate one.
