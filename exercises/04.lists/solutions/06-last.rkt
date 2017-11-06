#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да вземем последния елемент на даден списък

(define (length xs)
  (define (helper xs size)
    (if(null? xs)
       size
       (helper (cdr xs) (+ size 1))
       )
    )
  (helper xs 0)
)

(define (last xs)
  (if(= (length xs) 1)
     (car xs)
     (last (cdr xs))
     )
)

(define tests
  (test-suite "List ref tests"
    (check-equal? (last '(5 9 2)) 2)
    (check-equal? (last '(1 8 6 2 3)) 3)
    (check-equal? (last '(1)) 1)
    (check-equal? (last '(2 3)) 3)
  )
)

(run-tests tests 'verbose)
