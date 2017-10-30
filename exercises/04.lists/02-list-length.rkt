#lang racket
(require rackunit)
(require rackunit/text-ui)

; Търсим дължината на даден списък.

(define (length xs)
  (define (helper xs size)
    (if(null? xs)
       size
       (helper (cdr xs) (+ size 1))
       )
    )
  (helper xs 0)
)

(define tests
  (test-suite "dummy tests"
    (check-equal? (length '()) 0)
    (check-equal? (length '(1 2)) 2)
    (check-equal? (length '(3 2 1 2 3 9 3 #f)) 8)
  )
)

(run-tests tests 'verbose)