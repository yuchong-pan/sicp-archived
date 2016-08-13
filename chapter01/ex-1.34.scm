;; The interpreter will give an error. When the interpreter evaluates the combination (f f), it will then evaluate (f 2), and further, it
;; will evaluate (2 2). Since 2 is not a procedure, then the interpreter will throw an error.
