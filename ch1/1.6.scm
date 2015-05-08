; Alyssa P. Hacker doesn't see why `if` needs to be provided as a special form.
; "Why can't I just define it as an ordinary procedure in terms of `cond`? she asks.
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a
; new version of `if`

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses `new-if` to rewrite the square root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots

; Program will abort due to maximum recursion depth being exceeded. This is caused by
; the fact that Scheme uses applicative-order for evaluation and `new-if` is not a
; special form like regular `if`. Since regular `if` is a special form it evaluates 
; the predicate, then evalutes either the consequent OR the alternative. `new-if` NOT
; being special form, but rather being a procedure that uses  applicative-order to
; evaluate it's subexpression will continue to evaluate both the consequent AND alternative
; over and over, eventually blowing the stack. e.g. "That includes sqrt-iter which is 
; extended to new-if which again leads to the evaluation of all the sub-expressions 
; including sqrt-iter etc.
