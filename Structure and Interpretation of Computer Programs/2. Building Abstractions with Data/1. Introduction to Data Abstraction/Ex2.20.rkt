#lang sicp

(define (same-parity initial . rest)
  (define (iter input-list output-list)
    (if (null? input-list)
        output-list
        (if (even? (- (car input-list) initial))
                   (iter (cdr input-list) (cons (car input-list) output-list))
                   (iter (cdr input-list) output-list))))
  (cons initial (reverse (iter rest (list)))))
