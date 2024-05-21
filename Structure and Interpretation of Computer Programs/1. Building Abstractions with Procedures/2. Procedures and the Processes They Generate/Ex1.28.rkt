#lang sicp
(define (square x) (* x x))

(define (expmod-miller-rabin base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let ((a (expmod-miller-rabin base (/ exp 2) m)))
           (if (and (= (remainder (square a) m) 1) (not (or (= a 1) (= a (- m 1)))))
               0
               (remainder (square a) m)))
          )
        (else
         (remainder
          (* base (expmod-miller-rabin base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-miller-rabin a (- n 1) n) 1) )
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 23 50)
