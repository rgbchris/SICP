; Using the results of 1.16.scm and 1.17.scm, devise a procedure
; that generates an iterative process for multiplying two integers
; in terms of adding, doubling, and halving and uses a logarithmic
; number of steps.

(define (* a b)
  (define (double n) (+ n n))
  (define (halve n)  (/ n 2))
  (define (iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (iter acc (double a) (halve b)))
          (else (iter (+ acc a) a (- b 1)))))
  (iter 0 a b))

; (* 4 4)
; (iter 0 4 4)
; (iter 0 8 2)
; (iter 0 16 1)
; (iter (+ 0 16) 16 (- 1 1))
; (iter 16 16 0)
; => 16
