#lang sicp


;; Here, normal order evaluation returns 0, while applicative order evaluation turns into an infinite loop
;; Since in normal order evaluation, arguments aren't evaluated until they're needed
;; When (test 0 (p)) is called, (p) isn't evaluated
;; And in the if condition, since the alternative is only evaluated when the predicate is false, (p) isn't evaluated again
;; Instead, in the if-expression, the predicate evaluates to true, and 0 evaluates to 0

;; However, in case of applicative order, (p) is evaluated in the function call (test 0 (p))
;; Which leads to an infinite loop
