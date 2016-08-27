;;; Yuchong Pan
;;; Project 0

;;; PART 2

;;;
;;; The following test cases explore the evaluation of simple expressions.
;;;

-37
;Value: -37

(* 3 4)
;Value: 12

(> 10 9.7)
;Value: #t

(- (if (> 3 4)
       7
       10)
   (/ 16 10))
;Value: 42/5

(* (- 25 10)
   (+ 6 3))
;Value: 135

+
;Value 6: #[arity-dispatched-procedure 6]

(define double (lambda (x) (* 2 x)))
;Value: double

double
;Value 7: #[compound-procedure 7 double]

(define c 4)
;Value: c

c
;Value: 4

(double c)
;Value: 8

c
;Value: 4

(double (double (+ c 5)))
;Value: 36

(define times-2 double)
;Value: times-2

(times-2 c)
;Value: 8

(define d c)
;Value: d

(= c d)
;Value: #t

(cond ((>= c 2) d)
      ((= c (- d 5)) (+ c d))
      (else (abs (- c d))))
;Value: 4

;;; PART 3

;;;
;;; The following test case explores the difference between C-j and Enter followed by Tab.
;;;

;;; The following piece of code shows the result of the original expression (using C-j).

(define abs
  (lambda (a)
    (if (> a 0)
	a
	(- a))))

;;; The following piece of code uses the Enter key followed by the Tab key in place of each C-j.

(define abs
  (lambda (a)
    (if (> a 0)
	a
	(- a))))

;;; By comparison of the two pieces of code, it can be concluded that there is no difference in the result.

;;; PART 5

;;;
;;; The following answers explore some documentation and administrative questions.
;;;

;;; 1. To invoke the stepper, type M-s instead of C-x C-e when evaluating an expression. The stepper allows programmers to step through the program up to the point where the error happens, while the debugger is invoked when an error has occurred.

;;; 2. The words if, define, lambda and cond are "special forms".

;;; 3. Students should write up their results separately. Copying results from someone else is not permitted.

;;; 4.

;;; 5. Recitation attendance is essential and counts for 5% of the grade.

;;; 6. (1) Building abstractions, e.g. computational processes; (2) controlling interaction through conventional interfaces, e.g. generic operations; (3) designing new languages, e.g. interpretation of programming languages.

;;; 7. Scheme is case-insensitive except within character and string constants.

;;; 8. The Edwin commands for creating a new file and for saving a file is C-x C-f filename and C-x C-s, respectively. The *transcript* buffer is read-only, while the *scheme* buffer is editable.
