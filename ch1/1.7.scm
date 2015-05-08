; The good-enough? test used in computing square roots will not be very 
; effective for finding the square roots of very small numbers. Also, in 
; real computers, arithmetic operations are almost always performed with 
; limited precision. This makes our test inadequate for very large numbers. 
; Explain these statements, with examples showing how the test fails for 
; small and large numbers. An alternative strategy for implementing 
; good-enough? is to watch how guess changes from one iteration to the next 
; and to stop when the change is a very small fraction of the guess. Design 
; a square-root procedure that uses this kind of end test. Does this work 
; better for small and large numbers?

; The test would fail for very large numbers because it would take a very
; long time to achieve a result that is within 0.001, likewise the test
; also falis for very small numbers because anything under 0.001 will
; return good enough when a much smaller number is required to get an
; answer that is remotely correct.
;
; Old Method (difference between guess and improved guess is under 0.001)
; e.g. (sqrt 321421545325325454354543) ; too large (never returns)
; e.g. (sqrt 0.0005) ; too small (returns too soon)
;
; New Method (difference between guess and improved guess is under 0.001 percent)
; e.g. (sqrt 321421545325325454354543) ; 567425477099.6891 
; e.g. (sqrt 0.0005) ; 2.2361155764453716e-2 

; Based On Newton's method of successive approximations...
; Guess       Quotient                Average
; 1           (2/1) = 2               ((2 + 1)/2) = 1.5
; 1.5         (2/1.5) = 1.3333        ((1.3333 + 1.5)/2) = 1.4167
; 1.4167      (2/1.4167) = 1.4118     ((1.4167 + 1.4118)/2) = 1.4142
; 1.4142      ...                     ...

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

; (define (improve guess x)
;   (/ (+ x (/ x guess)) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; OLD METHOD
; (define (good-enough? guess x)
  ; (display guess)(newline)
  ; (< (abs (- (square guess) x)) 0.001)) ; old method

; NEW METHOD
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (sqrt x)
  (sqrt-iter 1.0 x))
