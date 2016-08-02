;;Exercise 1.8
;;Newton's method for cube roots is based on the fact
;;that if y is an approximation to the cube root of x , then a better
;;approximation is given by the value
;; (x/y^2 + 2y) / 3
;;Use this formula to implement a cube-root procedure analogous
;;to the square-root procedure.

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) (abs guess)) 0.00001))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(cube-root 8)
;;Value: 2.000004911675504
