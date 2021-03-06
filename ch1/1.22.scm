; Most Lisp implementations include a primitive called `runtime` that returns an
; integer that specifies the amount of time the system has been running (measured,
; for example, in microseconds). The following `timed-prime-test` procedure, when
; called with an integer n, prints n and checks to see if n is prime. If n is prime,
; the procedure prints three asterisks followed by the amount of time used in
; performing this test.

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time) n)
    #f))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; Using this procedure, write a procedure `search-for-primes` that checks the 
; primality of consecutive odd integers in a specified range. Use your
; procedure to fine the three smallest primes larger than 1000; larger than
; 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
; test each prime. Since the testing algorithm has order of growth of (sqrt n),
; you should expect that testing for primes around 10,000 should take about 
; (sqrt 10) times as long as testing for primes around 1000. Do your timing data
; best this out? How well do the data for 100,000 and 1,000,000 support the 
; (sqrt n) prediction? Is your result compatible with the notion that programs 
; on your machine run in time proportional to the number of steps required
; for the computation?

(define (search-for-primes n count)
  (if (> count 0)
    (if (timed-prime-test n)
      (search-for-primes (+ n 1) (- count 1))
      (search-for-primes (+ n 1) count))))
