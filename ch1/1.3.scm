; Define a procedure that takes three numbers as arguments and return the sum
; of the squares of the two larger numbers

(define
  (square n)
    (* n n))

(define
  (sum-of-squares a b c)
    (if (>= a b)
      (+ (square a) (square (if (>= b c) b c)))
      (+ (square b) (square (if (>= a c) a c)))))

(display (sum-of-squares 4 3 4))
