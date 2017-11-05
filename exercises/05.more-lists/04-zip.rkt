#lang racket
(require rackunit)
(require rackunit/text-ui)

; zip

(define (zip xs ys)
  (void)
)

(define tests
  (test-suite "Zip"
    (check-equal? (zip '(1 2 3) '(4 5 6)) '((1 4) (2 5) (3 6)))
  )
)

(run-tests tests 'verbose)