#lang sicp

(define (even? n)
  (= (remainder n 2) 0))
(define (double n) (* n 2))
(define (halve n) (/ n 2))

;; Here, our invariant quanitity is n + a*b
(define (fast-mul-iter a b)
  (define (iter n a b)
    (cond ((= b 0) n)
          ((even? b) (iter n (double a) (halve b)))
          (else (iter (+ n a) a (- b 1))))
    )
  (iter 0 a b)
  )
