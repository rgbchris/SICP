; Alyssa P. Hacker complains that we went to a lot of extra work
; in writing expmod. After all, shes says, since we already know
; how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our fast
; prime tester? Explain.

(define (fast-expt base exp) 
  (cond ((= exp 0) 1)
        ((even? exp) 
         (square (fast-expt base (/ exp 2)))) 
        (else 
          (* base (fast-expt base (- exp 1))))))

; (expmod 5 4 3)
; (remainder (fast-expt 5 4) 3)
; (remainder (square (fast-expt 5 2)) 3)
; (remainder (square (square (fast-expt 5 1))) 3)
; (remainder (square (square (* 5 (fast-expt 5 0)))) 3)
; (remainder (square (square (* 5 1))) 3)
; (remainder (square 25) 3)
; (remainder 625 3)
; => 1

; -------

; This is much faster becaouse it never works with numbers
; larger than m. It uses successive squaring to achieve this.
; "Simple arithmetic with very large numbers is much slower 
; than arithmetic with 32-bit integers."
(define (expmod2 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod2 base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod2 base (- exp 1) m))
            m))))

; (expmod2 5 4 3)
; (remainder (square (expmod2 5 2 3)) 3)
; (remainder (square (remainder (square (expmod2 5 1 3)) 3)) 3)
; (remainder (square (remainder (square (remainder (* 5 (expmod2 5 0 3)) 3)) 3)) 3)
; (remainder (square (remainder (square (remainder (* 5 1) 3)) 3)) 3)
; (remainder (square (remainder (square (remainder 5 3)) 3)) 3)
; (remainder (square (remainder (square 2) 3)) 3)
; (remainder (square (remainder 4 3)) 3)
; (remainder (square 1) 3)
; (remainder 1 3)
; => 1
