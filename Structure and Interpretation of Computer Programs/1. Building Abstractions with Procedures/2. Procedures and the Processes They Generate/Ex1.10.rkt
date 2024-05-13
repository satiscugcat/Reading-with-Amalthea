#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))


;; (A 0 n) is just 2*n, since the second case in the cond expression matches

;; (A 1 n) is evaluated as (A 0 (A 1 n-1)), which is evaluated to (A 0 (A 0 (A 1 n-2))) and so on
;; This happens until we get something of the form
;; (A 0 (A 0 (A 0 ....(A 1 1) ....)))
;; (A 1 1) evaluates to 2, since y is 1, an for each (A 0 ...) expression, the result of the previous application of (A 0 ...) is multiplied by 2.
;; It is easy to see there are n-1 such expressions.
;; Thus, we finally get 2^(n-1) * 2 = 2^n

;; (A 2 n) first gets expanded to (A 1 (A 1 (A 1 ....(A 2 1) ....)))
;; (A 2 1) returns 2, and we know (A 1 x) is 2^x, which means each application of (A 1 ...) will give the 2 to the power of the result of the previous application of (A 1 ...)
;; Thus, we will get 2^2^2^....2^2^2, a tower of exponents, with 2 appearing n times
