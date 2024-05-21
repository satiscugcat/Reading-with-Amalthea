#lang sicp

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i)
                            result)))))
  (iter k 0))

(define (d-term i)
  (if ( = (remainder (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2)
      1))
(define e (+ 2 (cont-frac (lambda (x) 1.0)
                          d-term
                          10)))

e