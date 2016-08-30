;;; Project 1, 6.001, Spring 2005

;;; idea is to simulate a baseball robot

;; imagine hitting a ball with an initial velocity of v 
;; at an angle alpha from the horizontal, at a height h
;; we would like to know how far the ball travels.

;; as a first step, we can just model this with simple physics
;; so the equations of motion for the ball have a vertical and a 
;; horizontal component

;; the vertical component is governed by
;; y(t) = v sin alpha t + h - 1/2 g t^2 
;; where g is the gravitational constant of 9.8 m/s^2

;; the horizontal component is governed by
;; x(t) = v cos alpha t
;; assuming it starts at the origin

;; First, we want to know when the ball hits the ground
;; this is governed by the quadratic equation, so we just need to know when 
;; y(t)=0 (i.e. for what t_impact is y(t_impact)= 0).
;; note that there are two solutions, only one makes sense physically

(define square
  (lambda (x) (* x x)))

;; these are constants that will be useful to us
(define gravity 9.8)  ;; in m/s
(define pi 3.14159)

;; Problem 1

(define position
  (lambda (a v u t)
    (+ (* 1/2 a t t)
       (* v t)
       u)))

;; In rectilinear motion with constant acceleration, the equation for the position of a particle at time t, given acceleration a, initial velocity v and initial position u, is u(t) = 1/2 at^2 + vt + u.

;; you need to complete this procedure, then show some test cases

; (position 0 0 0 0)     ; -> 0
; (position 0 0 20 0)    ; -> 20
; (position 0 5 10 10)   ; -> 60
; (position 2 2 2 2)     ; -> 10
; (position 5 5 5 5)     ; -> 185/2

;; The following additional test cases cover boundary and typical conditions.

; (position 0 5 0 10)    ; -> 50
; (position 0 5 20 10)   ; -> 70
; (position 5 0 0 10)    ; -> 250
; (position 5 0 20 10)   ; -> 270
; (position 5 10 0 20)   ; -> 1200
; (position 5 10 50 20)  ; -> 1250
; (position 5 10 20 50)  ; -> 6770
; (position 10 20 30 40) ; -> 8830


;; Problem 2

(define root1
  (lambda (a b c)
    (if (= a 0)
	(if (= b 0)
	    (error (if (= c 0)
		       "Infinitely many roots to the equation"
		       "No valid root to the equation")
		   (list a b c))
	    (- (/ c b)))
	(let ((delta (- (* b b)
			(* 4 a c))))
	  (if (< delta 0)
	      (error "No valid root to the equation" (list a b c))
	      (/ (- (- b)
		    (sqrt delta))
		 (* 2 a)))))))

;; When a=0, the equation degenerates to a linear equation. Hence, if b does not equal 0, then the unique root is -c/b. Otherwise, if b=c=0, then there are infinitely many roots to the equation; if b=0 but c does not equal 0, then there is no valid root to the equation.

;; For typical situations where a does not equal 0, let delta be b^2-4ac. If delta is less than 0, then there is no valid root to the equation az^2+bz+c=0; otherwise, the smaller root is (-b-sqrt(delta))/2a.

;; The following lines show some test cases.

; (root1 0 0 0)     ; -> Infinitely many roots to the equation (0 0 0)
; (root1 0 0 2)     ; -> No valid root to the equation (0 0 2)
; (root1 0 3 4)     ; -> -4/3
; (root1 5 3 6)     ; -> No valid root to the equation (5 3 6)
; (root1 1 2 1)     ; -> -1
; (root1 1 -3 2)    ; -> 1
; (root1 2 -5 2)    ; -> 1/2
; (root1 -2 6 3)    ; -> 3.4364916731037085

(define root2
  (lambda (a b c)
    (if (= a 0)
	(if (= b 0)
	    (error (if (= c 0)
		       "Infinitely many roots to the equation"
		       "No valid root to the equation")
		   (list a b c))
	    (- (/ c b)))
	(let ((delta (- (* b b)
			(* 4 a c))))
	  (if (< delta 0)
	      (error "No valid root to the equation" (list a b c))
	      (/ (+ (- b)
		    (sqrt delta))
		 (* 2 a)))))))

;; When a=0, the equation degenerates to a linear equation. Hence, if b does not equal 0, then the unique root is -c/b. Otherwise, if b=c=0, then there are infinitely many roots to the equation; if b=0 but c does not equal 0, then there is no valid root to the equation.

;; For typical situations where a does not equal 0, let delta be b^2-4ac. If delta is less than 0, then there is no valid root to the equation az^2+bz+c=0; otherwise, the greater root is (-b+sqrt(delta))/2a.

;; The following lines show some test cases.

; (root2 0 0 0)     ; -> Infinitely many roots to the equation (0 0 0)
; (root2 0 0 2)     ; -> No valid root to the equation (0 0 2)
; (root2 0 3 4)     ; -> -4/3
; (root2 5 3 6)     ; -> No valid root to the equation (5 3 6)
; (root2 1 2 1)     ; -> -1
; (root2 1 -3 2)    ; -> 2
; (root2 2 -5 2)    ; -> 2
; (root2 -2 6 3)    ; -> -.4364916731037085

;; complete these procedures and show some test cases

;; Problem 3

(define time-to-impact
  (lambda (vertical-velocity elevation)
    (max (root1 (* 0.5 -9.8)
		vertical-velocity
		elevation)
	 (root2 (* 0.5 -9.8)
		vertical-velocity
		elevation))))

;; According to Problem 1, we have u(t) = 1/2 at^2 + vt + u. When the baseball impacts the ground, we have u(t)=0. Hence, we have the quadratic equation -1/2 gt^2 + vt + u = 0. Since -1/2 g < 0 and u>=0, then the smaller root is less than zero and makes no sense. Therefore, the greater root to the equation is the time when the baseball impacts the ground.

;; The following lines show some test cases.

; (time-to-impact 0 0)     ; -> 0
; (time-to-impact 0 5)     ; -> 1.0101525445522106
; (time-to-impact 5 0)     ; -> 1.0204081632653061
; (time-to-impact 5 5)     ; -> 1.6418914802458588
; (time-to-impact 5 10)    ; -> 2.027149872175358

;; Note that if we want to know when the ball drops to a particular height r 
;; (for receiver), we have

(define time-to-height
  (lambda (vertical-velocity elevation target-elevation)
    (max (root1 (* 0.5 -9.8)
		vertical-velocity
		(- elevation target-elevation))
	 (root2 (* 0.5 -9.8)
		vertical-velocity
		(- elevation target-elevation)))))

;; We have -1/2 gt^2 + vt + u = u(t), where u(t) is a specified target elevation. Hence, we have -1/2 gt^2 + vt + (u-u(t)) = 0. Similarly to time-to-impact, we conclude that the greater root to the quadratic equation above is the time when the baseball drops to the given height.

;; The following lines show some test cases.

; (time-to-height 0 0 0)     ; -> 0
; (time-to-height 5 10 0)    ; -> 2.027149872175358
; (time-to-height 5 10 5)    ; -> 1.6418914802458588
; (time-to-height 5 10 20)   ; -> No valid root to the equation (-4.9 5 -10)
; (time-to-height 2 10 5)    ; -> 1.2346433610573548

;; Problem 4

;; once we can solve for t_impact, we can use it to figure out how far the ball went

;; conversion procedure
(define degree2radian
  (lambda (deg)
    (/ (*  deg pi) 180.)))

(define travel-distance-simple
  (lambda (elevation velocity angle)
    (let ((vx (* velocity (cos angle)))
	  (vy (* velocity (sin angle))))
      (let ((t (time-to-impact vy elevation)))
	(* t vx)))))

;; According to Figure 2, we have that the velocity in the x direction equals the velocity times the cosine of the angle, and that the velocity in the y direction equals the velocity times the sine of the angle. Hence, using time-to-impact, we can compute how long the baseball is in flight. Therefore, the traveled distance equals the time during which the baseball is in flight times the velocity in the x direction.

;; let's try this out for some example values.  Note that we are going to 
;; do everything in metric units, but for quaint reasons it is easier to think
;; about things in English units, so we will need some conversions.

(define meters-to-feet
  (lambda (m)
    (/ (* m 39.6) 12)))

(define feet-to-meters
  (lambda (f)
    (/ (* f 12) 39.6)))

(define hours-to-seconds
  (lambda (h)
    (* h 3600)))

(define seconds-to-hours
  (lambda (s)
    (/ s 3600)))

;; what is time to impact for a ball hit at a height of 1 meter
;; with a velocity of 45 m/s (which is about 100 miles/hour)
;; at an angle of 0 (straight horizontal)
;; at an angle of (/ pi 2) radians or 90 degrees (straight vertical)
;; at an angle of (/ pi 4) radians or 45 degrees

(define pi (acos -1.))
(time-to-impact (* 45 (cos 0)) 1)        ; -> 9.20584217798685
(time-to-impact (* 45 (cos (/ pi 2))) 1) ; -> .45175395145262587
(time-to-impact (* 45 (cos (/ pi 4))) 1) ; -> 6.525114117972054

;; what is the distance traveled in each case?
;; record both in meters and in feet

(define distance1 (travel-distance-simple 1 45 0))        ; -> 20.32892781536815 meters
(meters-to-feet distance1)                                ; -> 67.0854617907149 feet
(define distance2 (travel-distance-simple 1 45 (/ pi 2))) ; -> 2.5366286602636414e-14 meters
(meters-to-feet distance2)                                ; -> 8.370874578870016e-14 feet
(define distance3 (travel-distance-simple 1 45 (/ pi 4))) ; -> 207.62785983753528 meters
(meters-to-feet distance3)                                ; -> 685.1719374638665 feet

;; The following lines show some additional test cases.

; (travel-distance-simple 0 0 0)         ; -> 0
; (travel-distance-simple 0 45 (/ pi 2)) ; -> 2.530520171707541e-14
; (travel-distance-simple 0 45 (/ pi 4)) ; -> 206.6326530612245
; (travel-distance-simple 5 20 0)        ; -> 20.203050891044214
; (travel-distance-simple 5 20 (/ pi 6)) ; -> 42.54349315264964
; (travel-distance-simple 5 20 (/ pi 4)) ; -> 45.31950125659939
; (travel-distance-simple 5 20 (/ pi 3)) ; -> 38.031066754029354

;; Problem 5

;; these sound pretty impressive, but we need to look at it more carefully

;; first, though, suppose we want to find the angle that gives the best
;; distance
;; assume that angle is between 0 and (/ pi 2) radians or between 0 and 90
;; degrees

(define alpha-increment 0.01)

(define find-best-angle
  (lambda (velocity elevation)
    (define (try angle)
      (if (> angle (/ pi 2))
	  (cons -1 -1)
	  (max-pair (cons angle (travel-distance-simple elevation velocity angle))
		    (try (+ angle alpha-increment)))))
    (define (max-pair p1 p2)
      (if (> (cdr p1) (cdr p2)) p1 p2))
    (car (try 0))))

;; The find-best-angle procedure recursively tries different angles between 0 and pi/2, sampled every 0.01 radians, computes the corresponding distances, and gets the maximum value of these distances with the corresponding angle.

;; The following lines show some test cases.
; (find-best-angle 0 0)       ; -> 1.5700000000000012
; (find-best-angle 0 5)       ; -> 1.5700000000000012
; (find-best-angle 5 5)       ; -> .4200000000000002
; (find-best-angle 10 20)     ; -> .4200000000000002
; (find-best-angle 20 20)     ; -> .6200000000000003
; (find-best-angle 100 100)   ; -> .7400000000000004
; (find-best-angle 300 400)   ; -> .7600000000000005
; (find-best-angle 1000 1000) ; -> .7800000000000005
; (find-best-angle 2000 5000) ; -> .7800000000000005
; (find-best-angle 5000 5000) ; -> .7800000000000005

;; find best angle
;; try for other velocities
;; try for other heights

;; According to the test cases above, the conclusion can be reached that the optimal angle of hitting is around 0.78 radians or 45 degrees.

;; Problem 6

;; problem is that we are not accounting for drag on the ball (or on spin 
;; or other effects, but let's just stick with drag)
;;
;; Newton's equations basically say that ma = F, and here F is really two 
;; forces.  One is the effect of gravity, which is captured by mg.  The
;; second is due to drag, so we really have
;;
;; a = drag/m + gravity
;;
;; drag is captured by 1/2 C rho A vel^2, where
;; C is the drag coefficient (which is about 0.5 for baseball sized spheres)
;; rho is the density of air (which is about 1.25 kg/m^3 at sea level 
;; with moderate humidity, but is about 1.06 in Denver)
;; A is the surface area of the cross section of object, which is pi D^2/4 
;; where D is the diameter of the ball (which is about 0.074m for a baseball)
;; thus drag varies by the square of the velocity, with a scaling factor 
;; that can be computed

;; We would like to again compute distance , but taking into account 
;; drag.
;; Basically we can rework the equations to get four coupled linear 
;; differential equations
;; let u be the x component of velocity, and v be the y component of velocity
;; let x and y denote the two components of position (we are ignoring the 
;; third dimension and are assuming no spin so that a ball travels in a plane)
;; the equations are
;;
;; dx/dt = u
;; dy/dt = v
;; du/dt = -(drag_x/m + g_x)
;; dv/dt = -(drag_y/m + g_y)
;; we have g_x = - and g_y = - gravity
;; to get the components of the drag force, we need some trig.
;; let speeed = (u^2+v^2)^(1/2), then
;; drag_x = - drag * u /speed
;; drag_y = - drag * v /speed
;; where drag = beta speed^2
;; and beta = 1/2 C rho pi D^2/4
;; note that we are taking direction into account here

;; we need the mass of a baseball -- which is about .15 kg.

;; so now we just need to write a procedure that performs a simple integration
;; of these equations -- there are more sophisticated methods but a simple one 
;; is just to step along by some step size in t and add up the values

;; dx = u dt
;; dy = v dt
;; du = - 1/m speed beta u dt
;; dv = - (1/m speed beta v + g) dt

;; initial conditions
;; u_0 = V cos alpha
;; v_0 = V sin alpha
;; y_0 = h
;; x_0 = 0

;; we want to start with these initial conditions, then take a step of size dt
;; (which could be say 0.1) and compute new values for each of these parameters
;; when y reaches the desired point (<= 0) we stop, and return the distance (x)

(define drag-coeff 0.5)
(define density 1.25)  ; kg/m^3
(define mass .145)  ; kg
(define diameter 0.074)  ; m
(define beta (* .5 drag-coeff density (* 3.14159 .25 (square diameter))))

(define integrate
  (lambda (x0 y0 u0 v0 dt g m beta)
    (let ((dx (* u0 dt))
	  (dy (* v0 dt))
	  (du (- (* (/ m)
		    beta
		    (sqrt (+ (* u0 u0) (* v0 v0)))
		    u0
		    dt)))
	  (dv (- (* (+ (* (/ m)
			  (sqrt (+ (* u0 u0) (* v0 v0)))
			  v0
			  beta)
		       g)
		    dt))))
      (let ((new-x (+ x0 dx))
	    (new-y (+ y0 dy))
	    (new-u (+ u0 du))
	    (new-v (+ v0 dv)))
	(if (< new-y 0)
	    new-x
	    (integrate new-x new-y new-u new-v dt g m beta))))))

;; The integrate procedure moves forward time of dt every time, and computes the new values of x, y, u and v. If the new value of y drops below zero, then the corresponding x is the traveled distance of the baseball; otherwise, integrate moves forward dt again and computes the new values of x, y, u and v, and so on.

;; The following lines show some test cases.
; (integrate 0 0 0 0 .01 9.8 .15 .001344)         ; -> 0
; (integrate 10 10 0 0 .01 9.8 .15 .001344)       ; -> 10
; (integrate 0 0 20 20 .01 9.8 .15 .001344)       ; -> 53.80851494354015
; (integrate 10 20 30 40 .01 9.8 .15 .001344)     ; -> 112.08302758144761
; (integrate 100 100 100 100 .01 9.8 .15 .001344) ; -> 321.569077334666

(define travel-distance
  (lambda (initial-elevation initial-velocity initial-angle rho)
    (let ((C .5)
	  (D .074)
	  (dt .01)
	  (g 9.8)
	  (m .15))
      (let ((A (* pi D D 1/4)))
	(let ((beta (* .5 C rho A)))
	  (let ((x0 0)
		(y0 initial-elevation)
		(u0 (* initial-velocity
		       (cos initial-angle)))
		(v0 (* initial-velocity
		       (sin initial-angle))))
	    (integrate x0 y0 u0 v0 dt g m beta)))))))

;; The travel-distance procedure takes as arguments the initial elevation, velocity and angle and the specified value of rho, computes the corresponding x0, y0, u0, v0 and beta, and calls integrate to calculate the corresponding traveled distance.


;; RUN SOME TEST CASES

;; The following lines show some test cases.

; (travel-distance 0 45 (/ pi 4) 1.25)     ; -> 93.23390861728039
; (travel-distance 0 40 (/ pi 4) 1.25)     ; -> 82.31191076204233
; (travel-distance 0 35 (/ pi 4) 1.25)     ; -> 70.59221358199957

(define bound (feet-to-meters 300))        ; -> 90.9090909090909

(define get-boundary-angle
  (lambda (initial-elevation initial-velocity initial-angle bound delta op rho)
    (define (try angle)
      (let ((distance (travel-distance initial-elevation initial-velocity angle rho)))
	(if (< distance bound)
	    angle
	    (try (op angle delta)))))
    (try initial-angle)))

;; The get-boundary-angle procedure increments or decrements the angle of hitting by delta at a time, until the corresponding distance is less than the boundary distance.

(get-boundary-angle 0 45 (/ pi 4) bound .01 + 1.25)     ; -> .8553981633974483
(get-boundary-angle 0 45 (/ pi 4) bound .01 - 1.25)     ; -> .515398163397448

;; Hence, the range of angles for which the ball will land over the fence is from 0.52 to 0.86.

;; what about Denver?
(get-boundary-angle 0 45 (/ pi 4) bound .01 + 1.06)     ; -> .9753981633974484
(get-boundary-angle 0 45 (/ pi 4) bound .01 - 1.06)     ; -> .42539816339744796

;; The range of angles in Denver is from .43 to .98, which is larger than the range of angles in Boston.

;; Problem 7
 
;; now let's turn this around.  Suppose we want to throw the ball.  The same
;; equations basically hold, except now we would like to know what angle to 
;; use, given a velocity, in order to reach a given height (receiver) at a 
;; given distance

(define infinity 1e99)

(define shortest-time
  (lambda (desired-distance initial-elevation initial-velocity m beta g dt delta tolerance)
    (define (try angle)
      (if (> angle (/ pi 2))
	  infinity
	  (min (if (good-enough? (travel-distance angle)
				 desired-distance
				 tolerance)
		   (time-to-impact (* initial-velocity (sin angle))
				   initial-elevation)
		   infinity)
	       (try (+ angle delta)))))
    (define good-enough?
      (lambda (a b tolerance)
	(< (abs (- a b)) tolerance)))
    (define travel-distance
      (lambda (angle)
	(integrate 0
		   initial-elevation
		   (* initial-velocity (cos angle))
		   (* initial-velocity (sin angle))
		   dt
		   g
		   m
		   beta)))
    (let ((result (try 0)))
      (if (good-enough? result infinity tolerance)
	  0
	  result))))

;; The get-angle procedure tries different angles between 0 and pi/2, sampled every delta radians, to check whether the corresponding traveled distance is close enough to the desired distance. If the computed distance is close enough to the desired distance, then the procedure checks the corresponding time for the shortest time.

;; The following lines show some test cases.

; (shortest-time 0 0 0 .15 .001134 9.8 .01 .0001 .01)     ; -> 0.
; (shortest-time 0 0 10 .15 .001134 9.8 .01 .0001 .01)    ; -> 2.040816075162977
; (shortest-time 0 10 10 .15 .001134 9.8 .01 .0001 .01)   ; -> 2.7759846775353094
; (shortest-time 10 10 10 .15 .001134 9.8 .01 .0001 .01)  ; -> 2.6401004043530767
; (shortest-time 100 10 10 .15 .001134 9.8 .01 .0001 .01) ; -> 0

;; a cather trying to throw someone out at second has to get it roughly 36 m
;; (or 120 ft) how quickly does the ball get there, if he throws at 55m/s,
;;  at 45m/s, at 35m/s?
; (shortest-time 36 0 55 .15 .001134 9.8 .01 .0001 .1)    ; -> 11.094229042671891 seconds
; (shortest-time 36 0 45 .15 .001134 9.8 .01 .0001 .1)    ; -> 9.023745864057055 seconds
; (shortest-time 36 0 35 .15 .001134 9.8 .01 .0001 .1)    ; -> 1.242222777178302 seconds

;; try out some times for distances (30, 60, 90 m) or (100, 200, 300 ft) 
;; using 45m/s
; (shortest-time 30 0 45 .15 .001134 9.8 .01 .0001 .1)    ; -> .7613700151832731 seconds
; (shortest-time 60 0 45 .15 .001134 9.8 .01 .0001 .1)    ; -> 8.680688075886959 seconds
; (shortest-time 90 0 45 .15 .001134 9.8 .01 .0001 .1)    ; -> 3.688472303088773 seconds

;; Problem 8

;; Problem 9
