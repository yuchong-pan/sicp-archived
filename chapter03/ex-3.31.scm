;; If the wires are connected in a topological sequence (from input to output), the signal value of each wire will be initialized.

;; If the procedure added was not immediately run, the signal value of each wire would be set to 0 after initialization.
;; However, with the previous definition of `accept-action-procedure!`, wire E is set to 1 rather than 0.
