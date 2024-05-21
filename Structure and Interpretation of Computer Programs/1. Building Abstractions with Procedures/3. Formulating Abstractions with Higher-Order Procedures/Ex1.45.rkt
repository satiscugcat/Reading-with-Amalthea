#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))
(define tolerance 0.000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (lg x) (/ (log x) (log 2)))
(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (lg n))) ;; From my experimentation, I found you need to apply average-damp (floor (lg n)) number of times. Not sure why! Would love to hear a sound answer.
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

