#lang sicp
;; Let us look at the base cases of Fib(0) and Fib(1)
;; For 0, Fib(0) = (φ^0 - ψ^0)/sqrt(5) = 0
;; For 1, Fib(1) = (φ^1 - ψ^1)/sqrt(5) = sqrt(5)/sqrt(5) = 1
;; Thus this holds true for our base cases. Let us now prove the induction.
;; We know Fib(n) = Fib(n-1) + Fib(n-2)
;; Let us assume our hypothesis holds true for Fib(n-1) and Fib(n-2)
;; Then we have Fib(n) =  (φ^(n-1) - ψ^(n-1))/sqrt(5) + (φ^(n-2) - ψ^(n-2))/sqrt(5)
;; Which can be rewritten as
;; Fib(n) = (φ^(n-2)*(φ+1) - ψ^(n-2)*(ψ+1))/sqrt(5)
;; Now, since φ and ψ are solutions to the equation x^2 = x+1
;; Fib(n) = (φ^n - ψ^n)/sqrt(5)
;; Thus, the proof is complete.
