#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да дефинираме следните имена

; one, two, three, four, five, six, seven, eight, nine, ten
; plus, minus, times, div

(define (make-number n)
  (lambda xs
    (if (null? xs)
        n
        ((car xs) n))))

(define one (make-number 1))
(define two (make-number 2))
(define three (make-number 3))
(define four (make-number 4))
(define five (make-number 5))
(define six (make-number 6))
(define seven (make-number 7))
(define eight (make-number 8))
(define nine (make-number 9))

(define (make-operation op)
  (lambda (second-arg)
    (lambda (first-arg) (op first-arg second-arg))))

(define plus (make-operation +))
(define minus (make-operation -))
(define times (make-operation *))
(define div (make-operation quotient))


; Така че тестовете долу да минават.

(define tests
  (test-suite "Numbers tests"
    (check-equal? (one (plus (one))) 2)
    (check-equal? (three (times (five))) 15)
    (check-equal? (eight (div (two))) 4)
    (check-equal? (seven (times (six))) 42)
    (check-equal? (nine (minus (three))) 6)
    ; Добави и за изваждане
  )
)

(run-tests tests 'verbose)
