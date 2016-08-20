;; For generic operations with explicit dispatch, adding a new type requires to add a new clause to each operation, and adding a new
;; operation requries to include clauses for every type.
;;
;; For data-directed style, adding a new type requires to implement each operation for the new type and add the implementations to the
;; system, and adding a new operation requries to implement the operation for each type and add the implementations to the system.
;;
;; For message-passing style, adding a new type requires to implement every operation, and adding a new operation requires to add a new
;; clause to each type.
;;
;; Data-directed style would be most appropriate for a system in which new types must often be added, since each operation can be
;; implemented separately, and the names of procedures will not conflict due to the fact that they can be internal to the package.
;;
;; Message-passing style would be most appropriate for a system in which new operations must often be added, since name conflicts need not
;; be considered if a new operation is added as a new clause to each type.
