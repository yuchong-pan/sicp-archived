;; 1000000: P1 sets x to 100 and then P2 sets x to 100*100*100; or P2 sets x to
;;          1000 and then P1 sets x to 1000*1000.
;; 100000:  P1 changes x from 10 to 100 between the first and second times that
;;          P2 accesses the value of x during the evaluation of (* x x x).
;; 10000:   P2 changes x from 10 to 1000 between the two times that P1
;;          accesses the value of x during the evaluation  of (* x x x); or P1
;;          changes x from 10 to 100 between the second and third times that P2
;;          accesses the value of x during the evaluation of (* x x x).
;; 1000:    P2 accesses x (three times), then P1 sets x to 100, then P2 sets x.
;; 100:     P1 accesses x (twice), then P2 sets x to 1000, then P1 sets x.

;; Only 1000000 remains if we instead use serialized procedures, because the
;; execution of P1 and P2 cannot be interleaved.
