#lang sicp
;; We're assuming illegal entries are not given
;; Imagine the triangle to be a like a right angled isosceles triangle, with a vertical side on the left
;; 1
;; 1 1
;; 1 2 1
;; 1 3 3 1
;; 1 4 6 4 1
;; ....

;; We can see that each pascal-number, except the ones at the beginnings and the end of rows, is the sum of the number just above it and the number just to the topleft of it.
(define (get-pascal-num row column)
  (if (or (= column row)
          (= column 1))
      1
      (+ (get-pascal-num (- row 1) column)
         (get-pascal-num (- row 1) (- column 1)))))

;; Now we can even print n pascal triangle rows!
(define (generate-pascal-triangle rows)
  (define (generate-row row-number)
    (define (iter column)
      (if (<= column row-number)
          (begin (display (get-pascal-num row-number column))
                 (display " ")
                 (iter (+ column 1)))))
    (iter 1))
  (define (row-generator row-number)
    (if (<= row-number rows)
    (begin (generate-row row-number)
           (newline)
           (row-generator (+ row-number 1)))))
  (row-generator 1))

(generate-pascal-triangle 5)


;; Obviously, this pascal triangle generator isn't very efficient. Since we are calling get-pascal-number multiple for each element, causing multiple redundant calculations.
;; See if you can write a better procedure! Then try coming back to this later after completing chapter 2 and 3, and attack the problem with new tools in your arsenal.
