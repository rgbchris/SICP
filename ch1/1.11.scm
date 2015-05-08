; A function f is defined by the rule that...

; (mathematical function listed pg. 53)

; Write a procedure that computes f by means of a
; recursive process. 

(define (f n)
  (if (< n 3) 
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

; TESTS
; (f -1) ; => -1
; (f 0)  ; => 0
; (f 1)  ; => 1
; (f 2)  ; => 2
; (f 3)  ; => 4
; (f 4)  ; => 11

; Write a procedure that computes f by means of an 
; iterative process

(define (f-iter n) 
  (define (iter a b c count) 
    (if (< count 3)
      c 
      (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
    n
    (iter 0 1 2 n)))

; TESTS
; (f-iter -1) ; => -1
; (f-iter 0)  ; => 0
; (f-iter 1)  ; => 1
; (f-iter 2)  ; => 2
; (f-iter 3)  ; => 4
; (f-iter 4)  ; => 11
