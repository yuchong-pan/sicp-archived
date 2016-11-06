(define (or-gate a1 a2 output)
  (let ((b (make-wire))
        (c (make-wire))
        (d (make-wire)))
    (inverter a1 b)
    (inverter a2 c)
    (and-gate b c d)
    (inverter d output)))

;; The delay time of the or-gate is two inverter-delays plus one and-gate-delay.
