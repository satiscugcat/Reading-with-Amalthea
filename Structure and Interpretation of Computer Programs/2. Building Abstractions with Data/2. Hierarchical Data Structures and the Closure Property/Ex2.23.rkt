#lang sicp
(define (for-each func input-list)
  (if (not (null? input-list))
      (begin (func (car input-list))
             (for-each func (cdr input-list)))))
