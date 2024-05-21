#lang sicp

(define (iterative-improve good-enough? improve)
  (define (f guess)
    (if (good-enough? guess)
        guess
        (f (improve guess))))
  f)
(define tolerance 0.000000001)
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
  ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) tolerance))
                      (lambda (guess) (average guess (/ x guess))))
   1.0)) ;; Notice how the operantor is a compound expression, while the operator is just 1.0
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ((iterative-improve (lambda (guess) (close-enough? guess (f guess)))
                      f)
   first-guess))

