;;Exercise 1.3
;;Define a procedure that takes three numbers as arguments
;;and returns the sum of the squares of the two larger numbers

(define (biggest-two-square-sum a b c)
  (if (= a (max a b))
      (sum-of-squares a (max b c))
      (sum-of-squares b (max a c))))

(define (sum-of-squares x y)
  (define square (lambda (f) (* f f)))
  (+ (square x) (square y)))

(define (max a b)
  (if (> a b)
      a
      b))
