#lang racket
(require rackunit)
(require rackunit/text-ui)

; Търсим функция, която връща списък от първите n елемента на даден такъв.

(define (take n xs)
  (or (= n 0)
      (null? xs)
     '()
     (cons (car xs) (take (- n 1) (cdr xs)))
     )
)

(define tests
  (test-suite "Take tests"
     (check-equal? (take 2 '(1 2 3)) '(1 2))
     (check-equal? (take 0 '(2 9 2)) '())
     (check-equal? (take 2134 '(9 7 2 3)) '(9 7 2 3))
  )
)

(run-tests tests 'verbose)
