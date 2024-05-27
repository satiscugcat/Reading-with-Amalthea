#lang sicp

(define (count-factor number factor)
  (define (iter number count)
    (if (not (= (remainder number factor) 0))
        count
        (iter (/ number factor) (+ count 1))))
  (iter number 0))
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car pair)
  (count-factor pair 2))
(define (cdr pair)
  (count-factor pair 3))
