#lang racket
(require rackunit)
(require rackunit/text-ui)

; zip

(define (append xs ys)
  (if(null? xs)
     ys
     (cons (car xs) (append (cdr xs) ys)))
)

(define (zip xs ys)
  (if (or (null? xs) (null? ys))
      '()
      (cons (append (list (car xs)) (list (car ys))) (zip (cdr xs) (cdr ys)))
      )
)

(define tests
  (test-suite "Zip"
    (check-equal? (zip '(1 2 3) '(4 5 6)) '((1 4) (2 5) (3 6)))
    (check-equal? (zip '(28 9 12) '(1 3)) '((28 1) (9 3)))
  )
)

(run-tests tests 'verbose)
