#lang sicp


(define (accumulate-iter combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (combiner (term x) result))))
  (iter a null-value))

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (filtered-term x)
    (if (filter x)
        (term x)
        null-value))
  (accumulate-iter combiner null-value filtered-term a next b))

;; a
(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-square-prime-number a b)
  (filtered-accumulate + 0 square a inc b prime?))

;; b
(define (identity x) x)
(define (sum-relative-primes n)
  (define (relatively-prime? x)
    (= (gcd x n) 1))
  (filtered-accumulate + 0 identity 1 inc n relatively-prime?))



