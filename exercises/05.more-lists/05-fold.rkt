#lang racket
(require rackunit)
(require rackunit/text-ui)

; Като accumulate, но със списък, вместо с интервал.

(define (fold op null-value xs)
  (if(null? xs)
     null-value
     (op (car xs) (fold op null-value) (cdr xs)))
)

(define tests
  (test-suite "Fold tests"
     ; ???
  )
)
