;; If this initialization does not exist, then (propagate) will not work before any explicit assignments are done.
;; In other words, the signal value of some wires will not be initialized to the correct values.

;; Take the half-adder as an example. If this initialization does not exist, then the signal value of each wire is 0.
;; However, actually, if the signal values of A and B are both 0, then the signal value of E should be E, rather than 0.
