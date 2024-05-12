#lang sicp
;; An infinite recursion happens. Since scheme implementations use applicative order evaluation, the function call goes into an infinite loop trying to evaluate
;;(sqrt-iter (improve guess) x) which calls new-if, which again causes evaluation of another instance of (sqrt-iter (improve guess) x), and so on.