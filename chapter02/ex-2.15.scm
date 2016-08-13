;; Eva is right.
;;
;; If some variables that represent an uncertain number are repeated, then the repeated variables will be regarded as different variables,
;; and hence the percentage tolerance of the resulting interval will be larger than that without repeated variables.
;;
;; For example, if A is some measurement representing an uncertain number, then A/A should a certain number 1, whereas the system will
;; regard the two A's as two different measurements with the same interval and give an interval centered at 1 with some percentage
;; tolerance.
