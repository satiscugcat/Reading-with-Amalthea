#lang sicp



(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))


;; Changed code from original cube-iter procedure
(define (good-enough? guess x)
  (< (/ (abs (- guess (improve guess x))) guess) 0.00001))
;;
(define (cube-root x) (cube-root-iter 1.0 x))
