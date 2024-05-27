#lang sicp
(define (last-pair list)
  (if (pair? list)
      (if (null? (cdr list))
          list
          (last-pair (cdr list)))
      (error "Last-pair only accepts lists as arguments")))
