;; Applicative-order evaluation will first evaluate the subexpression (p). However, to evaluate (p), the interpretor will again evaluate
;; (p), according to the definition of the precedure (p), and so on. Hence, the evaluation will get stuck in an infinite recursion.
;;
;; Normal-order evaluation will first substitute (p) with (p) according to the definition of (p). Then, it will again substitute (p) with
;; (p), since (p) is still not a primitive operator, and so on. Hence, the evaluation will get stuck in an infinite recursion.
