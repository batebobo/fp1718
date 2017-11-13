#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "02-make-matrix.rkt")

; Търсим транспонираната матрица на дадена такава

(define (transpose m)
  (void))

(define tests
  (test-suite "Transpose tests"
    (check-equal? (transpose (make-matrix (range 1 7) 2 3)) (make-matrix '(1 4 2 5 3 6) 3 2))
    (check-equal? (transpose (make-matrix (range 7 13) 3 2)) (make-matrix '(7 9 11 8 10 12) 2 3))
    (check-equal? (transpose (make-matrix (range 1 5) 2 2)) (make-matrix '(1 3 2 4) 2 2))
  )
)

(run-tests tests 'verbose)
