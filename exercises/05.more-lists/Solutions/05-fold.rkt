#lang racket
(require rackunit)
(require rackunit/text-ui)

; Като accumulate, но със списък, вместо с интервал.

(define (fold op null-value xs)
  (if(null? xs)
     null-value
     (op (car xs) (fold op null-value (cdr xs))))
)

(define tests
  (test-suite "Fold tests"
     (check-equal? (fold + 0 '(1 2 3 4 5)) 15)
     (check-equal? (fold * 1 '(1 2 3 )) 6)
  )
)


(run-tests tests 'verbose)