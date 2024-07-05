#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (sequence) (list (car sequence))) seqs))
            (accumulate-n op init (map (lambda (sequence) (cdr sequence)) seqs)))))
;;;;;;;;;;

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; How would you define this if map could only take a procedure and a sequence as an argument?


(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row vector)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row) (matrix-*-vector cols m-row))m)))
