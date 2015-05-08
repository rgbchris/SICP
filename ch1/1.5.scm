; Ben Bitbiddle has invented a test to determine whether the interpreter he is faced
; with is using applicative-order evaluation or normal-order evaluation. He defines
; the following two procedures

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; Then he evaluates the expression

(display (test 0 (p)))

; What behavior will Ben observe with an interpreter that uses applicative-order
; evaluation? What behabvior will be observe with an interpreter that uses normal-
; order evaluation? Explain your answer. (Assume that the evaluation rule for the
; special form `if` is the same whether the interpreter is using normal or applica-
; tive order: The predicate expression is evaluted first, and the result determines
; whether to evaluate the consequent or the alternative expression)

;  `normal-order` evaluation means to fully expand, then reduce. The program runs
;  fine in `normal-order` because (p) is never evaluated.
;  
;  `applicative-order` means evaluate the arguments and then apply (which interpreter
;  actually uses). Using `applicative-order`, this program runs infinitely as (p) is 
;  recursively evaluated on itself.
;  (test 0 (p))
;  (test 0 (p))
;  (test 0 (p))
;  ...
