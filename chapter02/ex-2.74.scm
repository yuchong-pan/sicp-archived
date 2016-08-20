(define (get-record name personnel-file)
  ((get 'lookup (tagged-type personnel-file))
   name
   personnel-file))

;; a. The individual divisions' files should be structured so that employee's records can be looked up by their names. The type of the
;;    specified personnel file should be supplied.

(define (get-salary record)
  ((get 'lookup (tagged-type record))
   'salary
   record))

;; b. The record should be structured so that information can be looked up by the identifiers.

(define (find-employee-record name file-list)
  (if (null? file-list)
      #f
      (let ((result (get-record name (car file-lst))))
        (if result
            result
            (find-employee-record name (cdr file-list))))))

;; d. The procedure to look up a name in the personnel file of the new company should be installed into the data-directed system.
