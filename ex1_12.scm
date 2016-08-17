;;Exercise 1.12
;;Write a procedure that computes elements of Pascal's
;;triangle by means of a recursive process.

;;Solution

(define (pascal row col)
  (cond
   ((or (< row col) (< col 1)) 0)
   ((or (= col 1) (= col row)) 1)
   (else (+ (pascal (- row 1) (- col 1))
	    (pascal (- row 1) col)))))
