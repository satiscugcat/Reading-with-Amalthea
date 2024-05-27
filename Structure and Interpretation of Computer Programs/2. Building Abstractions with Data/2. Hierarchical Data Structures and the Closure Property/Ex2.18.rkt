#lang sicp
(define (reverse input)
  (define (iter input-list output-list)
    (if (null? input-list)
        output-list
        (iter (cdr input-list) (cons (car input-list) output-list))))
  (if (pair? input)
      (iter input (list))
      (error "Reverse only accepts lists as arguments")))