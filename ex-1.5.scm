;; Applicative-order evaluation will first evaluate the subexpression (p). However, to evaluate (p), the interpretor will again evaluate
;; (p), according to the definition of the precedure (p). Hence, the evaluation will get stuck in an infinite recursion.
;;
;; Normal-order evaluate will first expand (test 0 (p)) to
;; (if (= 0 0)
;;     0
;;     (p))
;; Then, the interpreter will substitute (p) with (p) according to the definition of the precedure (p), and substitute (p) with (p) again
;; since the expression still does not involve only primitive operators, and so on. Hence, the evaluation will get stuck in an infinite
;; recursion.
