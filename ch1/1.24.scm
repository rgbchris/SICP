; Modify the `timed-prime-test` procedure of exercise 1.22
; to use `fast-prime?` (the Fermat method), and test each of
; the 12 primes you found in that exercise. Since the Fermat
; test has (log n) growth. how would you expect the time to 
; test primes near 1,000,000 to compare with the time needed
; to test primes near 1000? Do your data bear this out? Can
; you explain any discrepancy you find?

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  ; (if (prime? n)
  (if (fast-prime? n 100) ; not sure what to put in for times so 100?
    (report-prime (- (runtime) start-time) n)
    #f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


; (define (smallest-divisor n)
;   (find-divisor n 2))
;
; (define (find-divisor n test-divisor)
;   (cond ((> (square test-divisor) n) n)
;         ((divides? test-divisor n) test-divisor)
;         (else (find-divisor n (+ test-divisor 1)))))
;
; (define (divides? a b)
;   (= (remainder b a) 0))
;
; (define (prime? n)
;   (= n (smallest-divisor n)))

; Compute the exponential of a number modulo another number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; grows in log n
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


; (timed-prime-test 1009) => .01
; (timed-prime-test 1013) => 0.
; (timed-prime-test 1019) => 0.
; (timed-prime-test 1021) => 0.
; (timed-prime-test 1031) => .01

; (timed-prime-test 1000000000039) => 0.
; (timed-prime-test 1000000000061) => 9.999999999999998e-3
; (timed-prime-test 1000000000063) => 1.0000000000000002e-2
; (timed-prime-test 1000000000091) => 1.0000000000000002e-2
; (timed-prime-test 1000000000121) => 9.999999999999995e-3

