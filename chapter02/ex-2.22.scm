;; The reason for which Louis Reasoner's square-list produces the answer list in the reverse order of the one desired is that, for each
;; step of the iterative process, the square of the first element is added to the beginning of the answer, and then the square of the
;; second element is added to the beginning, and so on. Hence, after the process, the answer list is in the reverse order.
;;
;; The fixed procedure, however, combines a list and a number as a pair. Hence, actually, the resulting pair is not a list because the cdr
;; of the pair is not the sublist consisting of all but the first item, but the square of the first item in the original list.
