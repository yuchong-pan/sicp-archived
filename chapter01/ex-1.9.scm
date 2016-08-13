;; The process generated by the first procedure in evaluatng (+ 4 5):
;; (+ 4 5)
;; (inc (+ 3 5))
;; (inc (inc (+ 2 5)))
;; (inc (inc (inc (+ 1 5))))
;; (inc (inc (inc (inc (+ 0 5)))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; 9
;;
;; The process generated by the second procedure in evaluating (+ 4 5):
;; (+ 4 5)
;; (+ 3 6)
;; (+ 2 7)
;; (+ 1 8)
;; (+ 0 9)
;; 9
;;
;; The process generated by the first procedure is recursive, because the process builds up a chain of deferred operations of inc. Hence,
;; the interpreter needs to keep track of the operations of inc to be performed later.
;;
;; In contrast, the process generated by the second procedure is iterative, because the state of the process can be summarized by 2 state
;; variables, a and b, and the process moves from state to state by decreamenting a by 1 and by incrementing b by 1. The interpreter need
;; to keep track of only 2 variables in order to execute the process.