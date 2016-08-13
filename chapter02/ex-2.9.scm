;; Suppose l1, l2 and l are the lower bounds of the first, second and resulting intervals, respectively.
;; Suppose u1, u2 and u are the upper bounds of the first, second and resulting intervals, respectively.
;; Suppose w1, w2 and w are the widths of the first, second and resulting intervals, respectively.
;;
;; According to the definition of the width, we have w1 = (u1-l1)/2, w2 = (u2-l2)/2 and w = (u-l)/2.
;;
;; According to the add-interval procedure, we have l = l1+l2 and u = u1+u2.
;; Hence, w = (u-l)/2 = ((u1+u2)-(l1+l2))/2 = (u1-l1)/2 + (u2-l2)/2 = w1+w2.
;; Therefore, the width of the sum of two intervals is a function only of the widths of the intervals being added.
;;
;; Similarly, according to the sub-interval procedure of Exercise 2.8, we have l = l1-u2 and u = u1-l2.
;; Hence, w = (u-l)/2 = ((u1-l2)-(l1-u2))/2 = (u1-l1)/2 + (u2-l2)/2 = w1+w2.
;; Therefore, the width of the difference of two intervals is a function only of the width of the intervals being subtracted.
;;
;; For example, l1 = 2, u1 = 10, l2 = 3 and u2 = 6.
;; Hence, w1 = (u1-l1)/2 = (10-2)/2 = 4, and w2 = (u2-l2)/2 = (6-3)/2 = 1.5.
;; According to the mul-interval procedure, we have l = 6 and u = 60, and hence w = (60-6)/2 = 27.
;; Similarly, according to the div-interval procedure, we have l = 1/3 and u = 10/3, and hence w = (10/3 - 1/3)/2 = 1.5.
;; Therefore, for multiplication or division, the fact that the width of the combination is not a function of the widths of the argument
;; intervals.
