#lang sicp
;; a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(product (lambda (x) x)
         1
         (lambda (x) (+ x 1))
         5)
(define (pi-approx n)
  (define (inc x) (+ x 1))
  (define (term k) (/ (* (* 2 k)
                         (* 2 (+ k 1)))
                      (* (+ (* 2 k) 1)
                         (+ (* 2 k) 1))))
  (* 4 (product term 1.0 inc n)))

;; b
(define (product-iter term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* (term x) result))))
  (iter a 1))