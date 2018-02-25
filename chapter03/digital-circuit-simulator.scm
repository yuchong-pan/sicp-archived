;; wire
(define (make-wire)
  (let ((signal-value 0)
        (actions '()))    
    (define (set-signal! new-value)
      (if (not (= signal-value new-value))
          (begin (set! signal-value new-value)
                 (call-each actions))
          'done))
    (define (add-action! action)
      (set! actions (cons action actions))
      (action))
    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-signal!)
            ((eq? m 'add-action!) add-action!)
            (else (error "Unknown operation -- WIRE" m))))
    dispatch))
(define (get-signal wire)
  (wire 'get-signal))
(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))
(define (add-action! wire action)
  ((wire 'add-action!) action))

(define (call-each actions)
  (if (null? actions)
      'done
      (begin ((car actions))
             (call-each (cdr actions)))))

;; logical gates
(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)
(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-action)
    (let ((new-value (logical-and (get-signal a1)
                                  (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action)
  (add-action! a2 and-action)
  'ok)
(define (logical-and a1 a2)
  (cond ((and (= a1 1) (= a2 1)) 1)
        ((and (= a1 0) (= a2 0)) 0)
        ((and (= a1 0) (= a2 1)) 0)
        ((and (= a1 1) (= a2 0)) 0)
        (else (error "Invalid signal" a1 a2))))

(define (or-gate a1 a2 output)
  (define (or-action)
    (let ((new-value (logical-or (get-signal a1)
                                 (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action)
  (add-action! a2 or-action))
(define (logical-or a1 a2)
  (cond ((and (= a1 0) (= a2 1)) 1)
        ((and (= a1 1) (= a2 0)) 1)
        ((and (= a1 1) (= a2 1)) 1)
        ((and (= a1 0) (= a2 0)) 0)
        (else (error "Invalid signal" a1 a2))))

;; agenda
(define (make-agenda) (list 0))
(define (current-time agenda) (car agenda))
(define (set-current-time! agenda current-time)
  (set-car! agenda current-time))
(define (segments agenda) (cdr agenda))
(define (set-segments! agenda segments)
  (set-cdr! agenda segments))
(define (first-segment agenda)
  (car (segments agenda)))
(define (rest-segments agenda)
  (cdr (segments agenda)))
(define (empty-agenda? agenda)
  (null? (segments agenda)))

(define (make-time-segment time queue)
  (cons time queue))
(define (segment-time s) (car s))
(define (segment-queue s) (cdr s))

(define (add-to-agenda! time action agenda)
  (define (belongs-before? segments)
    (or (null? segments)
        (< time (segment-time (car segments)))))
  (define (make-new-time-segment time action)
    (let ((q (make-queue)))
      (insert-queue! q action)
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= time (segment-time (car segments)))
        (insert-queue! (segment-queue (car segments))
                       action)
        (let ((rest (cdr segments)))
          (if (belongs-before rest)
              (set-cdr! segments
                        (cons (make-new-time-segment time action)
                              rest))
              (add-to-segments! rest)))))
  (let ((segments (segments agenda)))
    (if (belongs-before? segments)
        (set-segments! agenda
                       (cons (make-new-time-segment time action)
                             segments))
        (add-to-segments! segments))))

(define (remove-first-agenda-item! agenda)
  (let ((q (segment-queue (first-segment agenda))))
    (delete-queue! q)
    (if (empty-queue? q)
        (set-segments! agenda (rest-segments agenda)))))

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty -- FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
        (set-current-time! agenda (segment-time first-seg))
        (front-queue (segment-queue first-seg)))))

(define the-agenda (make-agenda))

(define (propagate)
  (if (empty-agenda? the-agenda)
      'done
      (let ((first-item (first-agenda-item the-agenda)))
        (first-item)
        (remove-first-agenda-item! the-agenda)
        (propagate))))

(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))

;; queue
(define (make-queue) (cons '() '()))
(define (front-ptr q) (car q))
(define (tail-ptr q) (cdr q))
(define (set-front-ptr! q ptr) (set-car! q ptr))
(define (set-tail-ptr! q ptr) (set-cdr! q ptr))
(define (empty-queue? q) (null? (front-ptr q)))
(define (front-queue q)
  (if (empty-queue? q)
      (error "Queue is empty -- FRONT-QUEUE")
      (car (front-ptr q))))
(define (insert-queue! q item)
  (let ((t (cons item '())))
    (if (empty-queue? q)
        (begin (set-front-ptr! q t)
               (set-tail-ptr! q t))
        (begin (set-cdr! (tail-ptr q) t)
               (set-tail-ptr! q t)))))
(define (delete-queue! q)
  (if (empty-queue? q)
      (error "Queue is empty -- FRONT-QUEUE")
      (set-front-ptr! q (cdr (front-ptr q)))))