#lang sicp

(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))
(define (fast-exp-iter b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))
      ))
  (iter 1 b n)
  )

;; Don't get confused by the naming of variables here, remember how scoping and free variables work!