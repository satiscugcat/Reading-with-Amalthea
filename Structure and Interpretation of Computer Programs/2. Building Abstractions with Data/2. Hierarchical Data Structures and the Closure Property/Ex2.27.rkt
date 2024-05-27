#lang sicp
(define (deep-reverse x)
  ;; Definition of reverse
  (define (reverse input)
    (define (iter input-list output-list)
      (if (null? input-list)
          output-list
          (iter (cdr input-list) (cons (car input-list) output-list))))
    (if (pair? input)
        (iter input (list))
        (error "Reverse only accepts lists as arguments")))
  ;; deep-reverse
  (if (not (pair? x))
      x
      (reverse (map deep-reverse x))))

(define x (list (list 1 2) (list 3 4)))
x
(deep-reverse x)