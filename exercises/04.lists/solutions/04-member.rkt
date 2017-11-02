#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да проверим дали х се съдържа в lst

(define (member? x lst)
  (if (null? lst)
     #f
     (if (= (car lst) x)
        #t
        (member? x (cdr lst))
     )
  )
)

; Използвайки cond
(define (member?? x lst)
  (cond ((null? lst) #f)
        ((= (car lst) x) #t)
        (else (member?? x (cdr lst)))))

(define tests
  (test-suite "member tests"
    (check-true (member? 2 (range 1 6)))
    (check-false (member? 22 (range 1 20)))
  )
)

(run-tests tests 'verbose)
