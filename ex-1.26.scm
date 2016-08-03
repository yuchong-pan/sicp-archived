;; Louis' procedure requires many redundant calculations; i.e., computing b^(2n) using Louis' expmod procedure requires computing b^n
;; twice plus one more multiplication. Hence, we have R(n) = R(n/2) + R(n/2), which yields R(n) = Theta(n). Rather, in the original expmod
;; procedure, it only requires one more multiplication than computing b^n. Hence, we have R(n) = R(n/2), which yields R(n) = Theta(log n).
