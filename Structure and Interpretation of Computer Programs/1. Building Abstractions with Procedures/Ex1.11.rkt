#lang sicp

;; Recursive version
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

;; Iterative version

(define (f2 n)
  (define (f2-iter a b c n)
    (cond ((= n 0) a)
          ((= n 1) b)
          ((= n 2) c)
          (else (f2-iter b
                         c
                         (+ c
                            (* 2 b)
                            (* 3 a)
                            )
                         (- n 1)))
          ))
  (f2-iter 0 1 2 n))