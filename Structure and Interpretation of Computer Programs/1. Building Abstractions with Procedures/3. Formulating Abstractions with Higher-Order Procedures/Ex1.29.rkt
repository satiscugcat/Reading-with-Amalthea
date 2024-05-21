#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (term k)   
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k)  2)
             (else 4))
       (f (+ a (* k h))))) 
  (define (add-h x) (+ x h))

  (* (/ h 3)(sum term 0 inc n)))

(define (cube x) (* x x x))

(simpsons-rule cube 0.0 1.0 100)
(simpsons-rule cube 0.0 1.0 1000)