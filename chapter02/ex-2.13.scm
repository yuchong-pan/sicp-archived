;; Assume that all numbers are positive.
;; Suppose that c1, c2 and c are the centers of the first, second and resulting intervals, respectively.
;; Suppose that w1, w2 and w are the widths of the first, second and resulting intervals, respectively.
;; Suppose that p1, p2 and p are the percentage tolerances of the first, second and resulting intervals, respectively.
;;
;; According to the definition of the percentage tolerance, we have p1 = w1/c1 and p2 = w2/c2.
;; According to the mul-interval procedure of Exercise 2.11, we have that the lower and upper bounds of the resulting interval are
;; (c1-w1)(c2-w2) and (c1+w1)(c2+w2), respectively.
;; Hence, the center of the resulting interval is ((c1-w1)(c2-w2)+(c1+w1)(c2+w2))/2, and the width of the resulting interval is
;; ((c1+w1)(c2+w2)-(c1-w1)(c2-w2))/2.
;; Therefore, the correspondnig percentage tolerance is ((c1+w1)(c2+w2)-(c1-w1)(c2-w2))/((c1-w1)(c2-w2)+(c1+w1)(c2+w2)) =
;; ((c1c2+c1w2+w1c2+w1w2)-(c1c2-c1w2-w1c2+w1w2))/((c1c2-c1w2-w1c2+w1w2)+(c1c2+c1w2+w1c2+w1w2)) = (c1w2+w1c2)/(c1c2+w1w2) =
;; (w2/c2+w1/c1)/(1+w1w2/c1c2) = (p1+p2)/(p1p2+1).
