#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "02-make-matrix.rkt")
 
; Търсим произведението на две матрици
(define (matrix* m1 m2)
  (void)
)

(define tests
  (test-suite "Multiplication tests"
    (let ((first-matrix (make-matrix (range 1 7) 2 3))
          (second-matrix (make-matrix (range 7 13) 3 2))
          (expected-result (make-matrix '(58 64 139 154) 2 2)))
      (check-equal? (matrix* first-matrix second-matrix) expected-result))
  )
)

(run-tests tests 'verbose)
