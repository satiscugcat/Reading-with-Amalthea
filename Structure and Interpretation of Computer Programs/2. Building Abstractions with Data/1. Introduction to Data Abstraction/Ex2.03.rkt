#lang sicp
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (add-points point1 point2)
  (make-point (+ (x-point point1) (x-point point1))
              (+ (y-point point1) (y-point point1))))

(define (subtract-points point1 point2)
  (make-point (- (x-point point1) (x-point point1))
              (- (y-point point1) (y-point point1))))

(define (make-segment point1 point2)
  (cons point1 point2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (distance-between-points point1 point2)
  (sqrt (+ (square (- (x-point point2) (x-point point1)))
           (square (- (y-point point2) (y-point point1))))))



(define (add-segments segment1 segment2)
  (if (not (eq? (end-segment segment1) (start-segment segment2)))
      (error "Second segment must start where first segment ends -- ADD-SEGMENTS")
      (make-segment (start-segment segment1) (end-segment segment2))))

(define (shift-start-point segment new-start-point)
  (let ((old-start-point (start-segment segment))
        (old-end-point (end-segment segment)))
  (make-segment new-start-point
                (add-points new-start-point (subtract-points old-end-point old-start-point)))))


;; Representation constructed using two adjacent sides starting from the same point.

(define (make-rectangle segment1 segment2)
  (if (not (eq? (start-segment segment1) (start-segment segment2)))
      (error "Sides must start from same point -- MAKE-RECTANGLE")
      (cons segment1 segment2)))


(define (rectangle-point0 rectangle)
  (start-segment (car rectangle)))

(define (rectangle-point1 rectangle)
  (end-segment (car rectangle)))

(define (rectangle-point3 rectangle)
  (end-segment (cdr rectangle)))

(define (rectangle-point2 rectangle)
  (end-segment (add-segments (car rectangle) (shift-start-point (cdr rectangle) (end-segment (car rectangle))))))

;; Perimeter and Area

(define (perimeter rectangle)
  (* 2 (+ (distance-between-points (rectangle-point0 rectangle) (rectangle-point1 rectangle))
          (distance-between-points (rectangle-point0 rectangle) (rectangle-point3 rectangle)))))

(define (area rectangle)
  (* (distance-between-points (rectangle-point0 rectangle) (rectangle-point1 rectangle))
     (distance-between-points (rectangle-point0 rectangle) (rectangle-point3 rectangle))))


;; Now try to see if you can define an alternate representation. Modify only constructors and selectors.
