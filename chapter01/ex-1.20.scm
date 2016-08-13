;; normal-order evaluation:
;; (gcd 206 40)
;; (= 40 0)
;; #f
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (= 6 0)
;; #f
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (= 4 0)
;; #f
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (= 2 0)
;; #f
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; (= 0 0)
;; #t
;; 2
;;
;; Hence, 4 remainder operations are actually performed in the normal-order evaluation of (gcd 206 40).
;; Also, 4 remainder operations are actually performed in the applicative-order evaluation of (gcd 206 40).