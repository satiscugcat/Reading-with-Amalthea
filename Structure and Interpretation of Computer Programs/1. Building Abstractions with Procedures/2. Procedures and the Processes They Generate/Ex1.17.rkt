#lang sicp
(define (even? n)
  (= (remainder n 2) 0))
(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (fast-mul a b)
  (cond ((= b 0) 1)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))
