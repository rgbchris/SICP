; The greatest common divisor (GCD) of two integers a and b is defined to
; be the largest integer that divides both a and b with no remainder. E.g.,
; the GCD of 16 and 28 is 4. One way to find the GCD of two integers is to
; factor them and search for common factors, but this is much more efficient.

; The idea of the algorithm is based on the observation that, if r is the
; remainder when a is divided by b, then the common divisors of a and b are
; precisely the same as the common divisors of b and r. Thus, we can use the
; equation...

GCD(a, b) = GCD(b, r)

; to successively reduce the problem of computing a GCD to the problem of
; computing the GCD of smaller and smaller pairs of integers. E.g., ...

GCD(206, 40) = GCD(40, 6)
			 = GCD(6, 4)
			 = GCD(4, 2)
			 = GCD(2, 0)
			 = 2

; reduces GCD(206, 40) to GCD(2, 0) which is 2. With any two positive ints,
; and repeated reductions will eventually produce a pair where the 2nd number
; is 0, then the GCD is the other number in the pair.

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

; This generates an iterative process, whose number of steps grows as the logarithm
; of the numbers involved.