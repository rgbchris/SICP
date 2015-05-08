; Base On Newton's method of successive approximations...
; Guess       Quotient                Average
; 1           (2/1) = 2               ((2 + 1)/2) = 1.5
; 1.5         (2/1.5) = 1.3333        ((1.3333 + 1.5)/2) = 1.4167
; 1.4167      (2/1.4167) = 1.4118     ((1.4167 + 1.4118)/2) = 1.4142
; 1.4142      ...                     ...; 

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  ; 1.0 is our initial guess, `x` is the radican (# we are trying to find the sqrt of)
  (sqrt-iter 1.0 x))
