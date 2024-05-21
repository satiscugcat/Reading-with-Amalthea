#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; φ is one of the solutions to the equation x^2 = x + 1, which can be rewritten as 1 + 1/x = x
;; Thus φ is a fixed point of the function f(x) = 1 + 1/x

(define phi (fixed-point (lambda (x) (+ 1 (/ 1 x)))
                       1.0))

phi