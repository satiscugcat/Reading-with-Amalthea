#lang sicp
;; README: This is a really important and insightful exercise! I'd strongly suggest taking an honest crack at it on your own before reading my solution.


(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; a

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; b
(define (simple-weight? x) (number? x))

(define (total-weight structure)
  (if (simple-weight? structure)
      structure
      (let ((left-structure (branch-structure (left-branch structure)))
            (right-structure (branch-structure (right-branch structure))))
        (+ (total-weight left-structure)
           (total-weight right-structure)))))

;; c

(define (balanced? structure)
  (if (simple-weight? structure)
      true
      (let ((left-structure (branch-structure (left-branch structure)))
            (right-structure (branch-structure (right-branch structure))))
        (and (= (total-weight left-structure) (total-weight right-structure))
             (balanced? left-structure)
             (balanced? right-structure)))))

;; d

;; The only thing we need to change is our selectors, we do not need to touch the functions at all.
;; Thus is the beauty of abstraction.
;; (•_•)
;; ( •_•)>⌐■-■
;; (⌐■_■)

;; As a bonus, if somehow the representation of what a "simple weight" is changes, we only need to change the definition of the predicate simple-weight?