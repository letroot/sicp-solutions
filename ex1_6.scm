;;Exercise 1.6
;;Alyssa P. Hacker doesn't see why if needs to be provided
;;as a special form. "Why can't I just define it as an ordinary
;;procedure in terms of cond ?" she asks. Alyssa's friend Eva Lu Ator
;;claims this can indeed be done, and she defines a new version of if :

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;;Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
;;5
(new-if (= 1 1) 0 5)
;;0

;;Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

;;What happens when Alyssa attempts to use this to compute square
;;roots? Explain.

;;Solution
;;new-if differs from the if special form, in that, new-if is a procedure.
;;new-if hence evaluates according to the applicative-order
;;mode of evaluation in which parameters are resolved before
;;being applied to the function body.
;;The third argument is a recursive function  that calls
;;itself infinitely and never resolves itself.
;;As a consequence, the new-if procedure body is never
;;applied to the three arguments.
