#lang sicp

;; Ex 1.1

; The expression is a primitive, thus evaluates to itself, 10

; The expression is the operator +, applied to the operands 5, 3, and 4, whose value is 12

; Similar to last question, except with a minus. Evaluates to 8

; / applied to 6 and 2 results in 3

; Here, the operator + is applied to operands which are themselves applications of operands + and - to 2,4 and 4,6 respectively. The result is 6

; The variable a is stored in the environment, and its value is 3

; The variable b is stored in the environment, and its value is (+ a 1) ie. (+ 3 1) ie. 4


; Equivalent to  (+ 3 4 (* 3 4)), answer is 19
; Checks equality of a and b, since they're unequal, evaluates as #f

; This is an if expression, where the predicate is "and" applied to (> b a), which evaluates to #t, and (< b (* a b)), which also evaluates to #t
; Since both the arguments operands to #t, the predicate as a whole evaluates to #t, thus, the consequent expression , b, is then evaluated, and 4 is printed

; First, equality of a and 4 is checked, evaluates to #f, then equality of b and 4 is checked, evaluates to #t, thus 16 is printed

; + is applied to the number 2, and the expression (if (> b a) b a)), whose value is b ie. 4, thus 6 is printed.

; * is applied to the result of the conditional expression, and the expression (+ a 1). Go through each step of the evaluation, if done correctly, you'll find the answer is -4.
