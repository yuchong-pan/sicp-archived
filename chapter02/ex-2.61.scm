(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

;; In the worst case, the item we are to add to the set may be larger than any item in the set, so the number of steps is the same as for
;; the unordered representation. On the other hand, if we add items of many different sizes, we can expect that sometimes we will be able
;; to stop iterating at a point near the beginning of the list and that other times we will still need to iterate most of the list. On the
;; average, number of steps required will be about n/2. This is still Theta(n) growth, but it does save us, on the average, a factor of 2
;; in number of steps over the previous implementation.
