;; (A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)))
;; (A 0 (A 0 (A 0 (A 1 7))))
;; ...
;; (A 0 (A 0 (A 0 (... (A 0 (A 0 (A 1 1)))))))
;; (A 0 (A 0 (A 0 (... (A 0 (A 0 2))))))
;; (A 0 (A 0 (A 0 (... (A 0 (* 2 2))))))
;; (A 0 (A 0 (A 0 (... (A 0 4)))))
;; (A 0 (A 0 (A 0 (... (* 2 4)))))
;; (A 0 (A 0 (A 0 (... 8))))
;; ...
;; 1024
;;
;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 4))
;; (A 1 16)
;; 65536
;;
;; (A 3 3)
;; (A 2 (A 3 2))
;; (A 2 (A 2 (A 3 1)))
;; (A 2 (A 2 2))
;; (A 2 4)
;; 65536
;;
;; The values of (A 1 10), (A 2 4), (A 3 3) are 1024, 65536 and 65536, respectively.
;;
;; (f n) computes 2n.
;; (g n) computes 2^n.
;; (h n) computes 2^(2^(2^...^2)) (n 2's).
