;; This is a safe change to make. There is no difference in what concurrency is
;; allowed by these two versions of make-account. By the definition of
;; serialization, any two executions of procedures in the same serialization
;; can run concurrently. Therefore, Ben's change gaurantees that two processes
;; cannot be withdrawing from or depositing into a single account concurrently.
