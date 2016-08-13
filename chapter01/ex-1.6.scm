;; Since new-if is defined as a combination, then all the arguments will be evaluated before the cond expression is evaluated. Hence, some
;; extra calculations will worsen the time efficiency of the program. In contrast, in the original if built in Scheme, the interpreter will
;; only evaluate either the <consequent> if the <predicate> yields true or the <alternative> otherwise.
