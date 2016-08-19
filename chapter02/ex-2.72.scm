;; Consider the special case where the relative frequencies of the n symbols are as described in Exercise 2.71.
;; The number of steps required to encode the most frequent symbol in the alphabet grows as R(n) = Theta(n).
;; The number of steps required to encode the least frequent symbol in the alphabet grows as R(n) = Theta(n) + Theta(n-1) + ... + Theta(1)
;; = Theta(n^2).
;; The number of steps required to encode a symbol in the alphabet, on the average, grows as R(n) = Theta(n) + Theta(n-1) + ... +
;; Theta(n/2) = Theta(n^2).
