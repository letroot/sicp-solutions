;;Exercise 1.11
;;A function f is defined by the rule that f(n) = n if
;;n<3 and f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3. Write a
;;procedure that computes f by means of a recursive process. Write
;;a procedure that computes f by means of an iterative process.


;;Solution

;;Recursive algorithm
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

;;Iterative algorithm
(define (f-iter n)
  (define (iter a b c count)
    (if (< count 3)
	c
	(iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
      n
      (iter 0 1 2 n)))
