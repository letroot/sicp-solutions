;;Exercise 1.7
;;The good-enough? test used in computing square
;;roots will not be very effective for finding the square roots of very
;;small numbers. Also, in real computers, arithmetic operations are
;;almost always performed with limited precision. This makes our
;;test inadequate for very large numbers. Explain these statements,
;;with examples showing how the test fails for small and large numbers.
;;An alternative strategy for implementing good-enough? is to
;;watch how guess changes from one iteration to the next and to
;;stop when the change is a very small fraction of the guess. Design
;;a square-root procedure that uses this kind of end test. Does this
;;work better for small and large numbers?

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;;old definition for good-enough?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;;the procedure fails for very small numbers
;;when using the old definition of good-enough?
(square (sqrt .0004))
;; 1.2532224857331766e-3

;;Solution
;;new definition for good-enough?
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.00001))

;;with new definition for good-enough?
(square (sqrt .0004))
;;4.0000000203508615e-4
;;we got a better result for small numbers

(square (sqrt 25))
;;the procedure still works pretty fine for larger numbers
;;25.00023178307672

;;Explanation (adapted from sicp wiki):
;;For computing the square root of small values, the absolute
;;tolerable accuracy of 0.001 is too large. For very large
;;values, "The machine precision is unable to represent small
;;differences between large numbers"
