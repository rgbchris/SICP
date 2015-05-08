; Newton's method for cube roots is based on
; the fact that if y is an approximation to the
; cube root of x, then a better approximation is
; given by the value...

; x / y^2 + 2y
; ------------
;      3

; Use this formula to implement a cube-root procedure
; analogous to the square-root procedure.

(define (cbrt-iter guess rad)
  (if (good-enough? guess rad)
    guess
    (cbrt-iter (improve guess rad) rad)))

(define (good-enough? guess rad)
  (< (abs (- (improve guess rad) guess))
     (abs (* guess 0.0001))))

(define (improve guess rad)
  (/ 
    (+ (/ rad (* guess guess)) (* guess 2)) 
    3))

(define (cbrt rad)
  ((if (< rad 0) - +) ; accounts for negative values
  (cbrt-iter 1.0 rad)))
