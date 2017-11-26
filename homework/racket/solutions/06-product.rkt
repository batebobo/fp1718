#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "02-make-matrix.rkt")
 
; Търсим произведението на две матрици
(define (matrix* m1 m2)
  (define (dot-product v1 v2)
    (if (or (null? v1) (null? v2))
        0
        (+ (* (car v1) (car v2)) (dot-product (cdr v1) (cdr v2)))))
  
  (define (get-new-row row matrix)
    (if (null? (car matrix))
        '()
        (let ((current-column (map car matrix))
              (rest-of-columns (map cdr matrix)))
          (cons (dot-product row current-column)
                (get-new-row row rest-of-columns)))))
  
  (map (lambda (current-row) (get-new-row current-row m2)) m1)
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
