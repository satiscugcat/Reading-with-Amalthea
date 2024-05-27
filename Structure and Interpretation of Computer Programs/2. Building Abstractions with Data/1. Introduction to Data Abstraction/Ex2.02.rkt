#lang sicp
(define (average x y) (/ (+ x y) 2))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))


(define (make-segment point1 point2)
  (cons point1 point2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))



;; Think carefully. Does this preserve abstraction barriers? Why or why not? 
;; If it does, where would you place it in the ladder shown in the text before this?
;; If it doesn't, Could you rewrite it so that it does?
(define (mid-point segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))