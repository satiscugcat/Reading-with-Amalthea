#lang sicp

(define (square x) (* x x))

;; One way to do this is to sum all of them, and then just subtracting the least

(define (f1 a b c)
  (- (+ (square a) (square b) (square c))
     (square (min a b c))))

;; Another way is a case-by-case analysis

(define (f2 a b c)
  (if (>= a b)
      (if (>= b c)
          (+ (square a)
             (square b))
          (+ (square a)
             (square c)))
      (if (>= a c)
          (+ (square b)
             (square a))
          (+ (square b)
             (square c)))))

;; Try to see if you can understand both of these!