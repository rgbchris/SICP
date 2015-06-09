; Louis Reasoner is having great difficulty doing Ex. 1.24
; His `fast-prime?` test seems to run more slowly than his
; `prime?` test. Louis calls his friend Eva Lu Ator over to 
; help. Whe they examine Louis's code, they find that he has
; rewritten the `expmod` procedure to use an explicit 
; multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         ; successive squaring (much faster)
         ; (square (expmod base (/ exp 2) m))
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base
                        (expmod base (- exp 1) m))
                     m))))

; "I don't what difference that could make," says Louis.
; "I do." says Eva. "By writing the procedure like that, you
; have transformed the (log n order of growth) process into a
; (n order of growth) process"
; Explain:

; By hardcoding `expmod` twice instead of squaring it once
; (for even numbers), twice the amount of work is being done. 
; This causes the process to become tree-recursive
