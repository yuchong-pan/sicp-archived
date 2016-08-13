(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (rest)
                            (cons (car s) rest))
                          rest)))))

;; The subsets procedure first computes the set of all subsets of the subset of s consisting of all but the first item, i.e. (car s), and
;; stores the result in rest. Then, the map procedure adds (car s) to each subsets in rest. Hence, for each subset of the subset of s
;; consisting of all but (car s), there are exactly two cases, with and without (car s), which include all situations of the existence of
;; (car s). Therefore, after the recursive process, every item in s is considered, and hence the procedure generates the set of subsets of
;; a set.
