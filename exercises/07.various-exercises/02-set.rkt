#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да изключим всички повтарящи се елементи от xs.
; Подредбата на резултатния списък не ни интересува.

(define (to-set xs)
  (void))


(define tests
  (test-suite "to-set tests"
    (letrec ((subset? (lambda (xs ys)
                       (or (null? xs)
                           (and (member (car xs) ys)
                                (subset? (cdr xs) ys)))))
             (equal-sets? (lambda (xs ys)
                            (and (subset? xs ys)
                                 (subset? ys xs)))))
    (check-true (equal-sets? (to-set '(a a a a b c c a a d e e e e)) '(a b c d e))))
  )
) 

(run-tests tests 'verbose)
