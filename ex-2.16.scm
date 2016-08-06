;; As is explained in Exercise 2.15, it is repeated variables representing uncertain numbers that matter.
;; If repeated variables that represent uncertain numbers occur in the expression, such as R1R2/(R1+R2) in par1, then the repeated
;; variables, i.e. R1 in the numerator and R1 in the dominator, will be regarded as different intervals. Hence, the percentage tolerance
;; of the resulting interval will be larger.
;;
;; For example, if A is some measurement representing an uncertain number, then A/A should a certain number 1, whereas the system will
;; regard the two A's as two different measurements with the same interval and give an interval centered at 1 with some percentage
;; tolerance.
;;
;; Therefore, it is impossible to devise an interval-arithmetic package that does not have this shortcoming, since only the values of the
;; intervals are given to the system and thus the system cannot tell whether two intervals with the same value represent the same
;; measurement or not.
