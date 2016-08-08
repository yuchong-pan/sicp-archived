;; In the original (queens k) for each k such that 1<=k<=n, (queens (- k 1)) will be done only once. Hence, R(n) = R(n-1)+f(n), where f(n)
;; equals n times the number of solutions in the first k-1 columns. In contrast, after Louis's interchange, each (queens k) requires
;; (queens (- k 1)) being done n times. Hence, R'(n) = n*R'(n-1)+f(n). Therefore, Louis's interchange makes the program run slowly.
;;
;; Assuming that the program in Exercise 2.42 solves the eight-queens puzzle in time T, it will take Louis's program approximately time
;; 8^8*T to solve the puzzle.
