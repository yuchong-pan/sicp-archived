;; Take the and-gate whose inputs are initially 0 and 1 as an example.
;; Assume a segment's procedures are stored in a LIFO list.
;; Name the first input wire A and the second input wire B.

;; We first change A to 1.
;; At this point, B is 1.
;; Hence, we add to the LIFO list a procedure which sets the output wire 1 after an and-gate delay.

;; In the same segment, we change B to 0.
;; At this point, A has been changed to 1.
;; Hence, we add to the LIFO list a procedure which sets the output wire 0 after an and-gate delay.

;; In the LIFO list, the second procedure will be run first, and then the first procedure will be run.
;; Thus, eventually, the signal value of the output wire is set to 1, whereas the correct value should be 0.

;; In general, a segment's procedures should be stored in a FIFO list.
