; The following pattern of numbers is called Pascal's triangle

;            1
;          1   1
;        1   2   1
;      1   3   3   1
;    1   4   6   4   1
;          .....

; The numbers at the edge of the triangle are all 1, and each
; number inside the triangle is the sum of the two numbers
; above it. Write a procedure that computes elements of
; Pascal's triangle by means of a recursive process

; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1

(define (pascal-triangle row col)
  (cond ((> col row) 0) ; outside triangle
        ((< col 0)   0) ; outside triangle
        ((= col 1)   1) ; col 1 is all 1's
        ((+ (pascal-triangle (- row 1) (- col 1)) 
            (pascal-triangle (- row 1) col)))))
