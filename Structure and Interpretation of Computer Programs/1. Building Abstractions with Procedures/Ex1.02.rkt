#lang sicp

;; Try to read the expression from outward to inward! Go carefully, the answer is simple.

(/
 (+ 5 4 (- 2
           (- 3
              (+ 6
                 (/ 4 5)))))
 (* 3
    (- 6 2)
    (- 2 7)))