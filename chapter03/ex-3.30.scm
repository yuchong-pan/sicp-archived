(define (ripple-carry-adder a b s c)
  (if (null? a)
      (begin (set-signal! c 0)
             'ok)
      (let ((new-c (make-wire)))
        (full-adder (car a) (car b) new-c (car s) c)
        (ripple-carry-adder (cdr a) (cdr b) (cdr s) new-c))))

;; The delay needed to obtain the complete output from an n-bit ripple-carry adder is n times the delay for full-adders.
;; The delay for full-adders is 2 times the delay for half-adders plus the delay for or-gates.
;; Further, the delay for half-adders is max(2 * and-gate-delay + inverter-delay, or-gate-delay + and-gate-delay).
;; Hence, the delay for ripple-carry adders is 2n * max(2 * and-gate-delay + inverter-delay, or-gate-delay + and-gate-delay) + n * or-gate-delay.
