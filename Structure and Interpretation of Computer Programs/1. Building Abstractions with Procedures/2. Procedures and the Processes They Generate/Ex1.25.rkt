#lang sicp
(define (square x) (* x x))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

;; The above expmod allows us to compute the mod of much higher exponentials efficiently as compared to what alyssa is suggesting.
;; Consider the case where the base is 6 and the exp is 199 and m is 199.  Fast-expt first need to calculate 6^199, which is very large!
;; Computation with large numbers gets progressively difficult, thus to avoid that issue, expmod is written seperately.
;; Since both the expmod and fast-exp procedure call square the same number of times, it becomes more efficient to work with expmod.