; Observe that our model of evaluation allows for combinations whose operators
; are compound expressions. Use this observation to describe the behavior of the
; following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; according to the conditional if b is greater than 0, than use addition
; otherwise use subtraction

(a-plus-abs-b 4 5)  ; 9
(a-plus-abs-b -4 3) ; -1 
