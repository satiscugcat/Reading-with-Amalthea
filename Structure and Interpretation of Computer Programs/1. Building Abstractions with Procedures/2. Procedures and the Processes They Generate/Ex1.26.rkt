#lang sicp
;; This happens because expmod is called twice in the even branch, where normally it is called only once, and then squared by the square procedure.
