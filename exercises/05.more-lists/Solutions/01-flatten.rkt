#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да направим списък от всички стойности в даден такъв.
; Искаме нивата на влагане да изчезнат.

(define (append xs ys)
  (if(null? xs)
     ys
     (cons (car xs) (append (cdr xs) ys)))
)

(define (flatten xs)
  (if(null? xs)
     '()
     (if(list? (car xs))
       (append (flatten (car xs)) (flatten (cdr xs)))
       (cons (car xs) (flatten (cdr xs)))))
)

(define tests
  (test-suite "Flatten"
    (check-equal? (flatten '(1 (3 4) ("wow" ("nesting") ("overload" 38 91)))) '(1 3 4 "wow" "nesting" "overload" 38 91))
    (check-equal? (flatten '(1 2 3)) '(1 2 3))
    (check-equal? (flatten '(((3)))) '(3))
  )
)

(run-tests tests 'verbose)
