; The sine of an angle (specified in radians) can be computed
; by making use of the approximation sin x ≈ x if x is
; sufficiently small, and the trigonometic identity

; sin x = 3 sin(x/3) - 4 sin^3(x/3)

; to reduce the size of the argument of sin. (For purposes of
; this exercise an angle is considered "sufficiently small" if
; its magnitude is not great than 0.1 radians.) These ideas
; are incorporated in the following procedures:

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when (sine
; 12.15) is evaluated?
; => 5

; (sine 12.15)
; (p (sine (/ 12.15 3.0)))
; (p (sine 4.05))
; (p (p (sine (/ 4.05 3.0)))
; (p (p (sine 1.3499999)))
; (p (p (p (sine (/ 1.3499999 3.0)))))
; (p (p (p (sine .4499999999997))))
; (p (p (p (p (sine (/ .4499999999997 3.0))))))
; (p (p (p (p (sine .14999999999999988)))))
; (p (p (p (p (p (sine (/ .14999999999999988 3.0)))))))
; (p (p (p (p (p (sine .04999999999999996))))))
; (p (p (p (p (p .04999999999999996)))))
; (p (p (p (p .14949999999999988))))
; (p (p (p .4351345504999997)))
; (p (p .975846533167877))
; (p -.7895631144708211)
; -.3998034574133478

; b. What is the order of growth in space and number of
; steps (as a function of a) used by the process generated 
; by the sine procedure when (sine a) is evaluated?
; => O(log(x)) 
