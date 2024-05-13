#lang sicp

;; We can use matrix multiplication to derive our required values
;; Tpq is essentially the linear transformation denoted by
;; (p+q , q)
;; ( q  , p)
;; applied to the column vector
;; ( a )
;; ( b )
;; Thus Tpq^2 is just that linear transformation applied twice, through basic matrix multiplication, we will get
;; ( p^2 + 2pq + 2q^2 , 2pq + q^2 )
;; (   2pq + q^2      , p^2 + q^2 )
;; Thus, p' = p^2 + q^2 and q' = 2pq + q^2
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 10)