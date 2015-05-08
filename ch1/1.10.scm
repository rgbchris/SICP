; The following procedure computes a mathematical function
; called Ackermann's function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; What are the values of the following expressions?

; (A 1 10) ; => 1024
; (A 2 4)  ; => 65536
; (A 3 3)  ; => 65536

; Consider the following procedures, where A is the
; procedure defined above:

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; Give concise mathematical definitions for the functions 
; computed by the procedures f, g, and h for positive
; integer values of n. E.g. (k n) computes 5n^2

(f 0) ; => 0
(f 1) ; => 2
(f 2) ; => 4
(f 3) ; => 6
(f 4) ; => 8
; => 2n

(g 0) ; => 0
(g 1) ; => 2
(g 2) ; => 4
(g 3) ; => 8
(g 4) ; => 16
(g 5) ; => 32
; => 2^n

(h 0) ; => 0
(h 1) ; => 2
(h 2) ; => 4
(h 3) ; => 16 
(h 4) ; => 65536
(h 5) ; => Maximum recursion depth exceeded
; => 2^2^2^2^2..... (n is the number of 2's)
