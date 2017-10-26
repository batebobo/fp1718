#lang racket
(require rackunit)
(require rackunit/text-ui)

; Функцията sum, която видяхме на упражнение.
; Да стане по итеративен начин.

(define (sum start end term next)
  (define (helper start end term next result)
    (if(> start  end)
       result
       (helper (next start) end term next (+ result (term start)))
       )
    )
  (helper start end term next 0)
)

(define (id x) x)
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define tests
  (test-suite "Iterative sum tests"

    (check-equal? (sum 1 100 id inc) 5050)
    (check-equal? (sum 9 9 id inc) 9)
    (check-equal? (sum 1 10 square inc) 385)
  )
)

(run-tests tests 'verbose)
