#lang sicp
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; With normal order evaluation, the evaluation happens as follows

;; (gcd 206 40)
;; (if (= 40 0) 206 (gcd 40 (remainder 260 40)))
;; because 40 is not equal to 0, the alternative is evaluated.
;; (gcd 40 (remainder 206 40))
;; here, since we have normal order evaluation, the remainder operation isn't evaluated, thus we have
;; (if (= (remainder 206 40) 0)
;;     40
;;     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; now, the predicate NEEDS to be evaluated, resulting in our 1st call of remainder. Since it doesnt turn out to be 0, we go to the alternative gcd call.
;; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; the resulting if expression becomes

;; (if (= (remainder 40 (remainder 206 40)) 0)
;;     (remainder 206 40)
;;     (gcd (remainder 40 (remainder 206 40))
;;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; It's like watching horror unfold before your eyes.
;; Here, with the evaluation of the predicate, we get 2 more remainder calls.

;; Now, since the predicate is false, we move on to the alternative gcd call

;;     (gcd (remainder 40 (remainder 206 40))
;;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;; This becomes

;; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;;     (remainder 40 (remainder 206 40))
;;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;          (remainder (remainder 40 (remainder 206 40))
;;                     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; Evaluation of predicate results in another 4 more remainder calls, along with a false value, which means we need to go into the alternative AGAIN

;; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;      (remainder (remainder 40 (remainder 206 40))
;;                 (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; This finally evaluates to

;; (if (=  (remainder (remainder 40 (remainder 206 40))
;;                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;         0)
;;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;     (gcd (remainder (remainder 40 (remainder 206 40))
;;                     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;                     (remainder (remainder 40 (remainder 206 40))
;;                                (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;;     ) 


;; Here, with SEVEN more remainder calls, the predicate finally evaluates to true
;; Now, we can finally go to the consequent, which with 4 remainder calls, gives us the final answer

;; Thus, the total number of remainder calls in normal order evaluation is 1 + 2 + 4 + 7 + 4 = 18 !!


;; Let us now look at the applicative order case
;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; and now, since (= b 0) evaluates to true, a ie. 2 is returned.
;; with applicative order evaluation, we get 4 calls to remainder.
