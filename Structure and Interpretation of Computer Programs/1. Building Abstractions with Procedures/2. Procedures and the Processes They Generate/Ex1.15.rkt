#lang sicp
;; It is important to remember the applicative order of evaluation that scheme uses;
;; Here, (sine 12.15) is expanded and evaluated as follows
;; (p (sin 4.05))
;; (p (p (sin 1.35)))
;; (p (p (p (sin 0.45))))
;; (p (p (p (p (sin 0.15)))))
;; (p (p (p (p (p (sin 0.05))))))
;; (p (p (p (p (p 0.05)))))
;; (p (p (p (p 0.1495))))
;; (p (p (p 0.4351345505)))
;; (p (p 0.9758465331678772))
;; (p -0.7895631144708228)
;; -0.39980345741334

;; Thus, the procedure p is applied 5 times in the end
;; The number of steps and growth in space is proportional to the number of times p is appleid
;; p is applied as many times as the angle is divided by 3 until it is less than the threshold
;; Thus we have a/3^n = 0.1
;; n = log3(10*a)
;; Thus n grows with log(a)