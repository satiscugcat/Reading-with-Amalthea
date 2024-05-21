#lang sicp

;; a
(define (cont-frac1 n d k)
  (define (recursive i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (recursive (+ i 1))))))
  (recursive 1))

(cont-frac1 (lambda (i) 1.0)
            (lambda (i) 1.0)
            1000)


;; b

(define (cont-frac2 n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i)
                            result)))))
  (iter k 0))

(cont-frac1 (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)