#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да групираме последователни еднакви елементи на списък в подсписъци.
; Както в теста.
 
(define (group xs)
  (void))

(define tests
  (test-suite "Group tests"
    (check-equal? (group '(1 1 1 2 2 3 1 1 1 2 2 2 2 2 3 3 3 3)) '((1 1 1) (2 2) (3) (1 1 1) (2 2 2 2 2) (3 3 3 3)))
  )
)

(run-tests tests 'verbose)
