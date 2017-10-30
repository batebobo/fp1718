#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме функция, която приема списък и две числа и връща
; списък, състоящ се от елементите на списъка, които се намират на индекси от първото число до второто.

(define (slice xs start end)
  (define (helper xs start end counter)
    (if(null? xs)
       '()
       (if(and (>= counter start)
               (<= counter end))
          (cons (car xs) (helper (cdr xs) start end (+ counter 1)))
          (if(< counter start)
             (helper (cdr xs) start end (+ counter 1))
             '()
             )
          )
    )
  )
  (helper xs start end 0)
)

(define tests
 (test-suite "Slice tests"
     (check-equal? (slice '(1 9 8 2) 1 2) '(9 8))
     (check-equal? (slice '(1 9 2 8 3) 2 10) '(2 8 3))
     (check-equal? (slice '(9 7 2 3) 0 2) '(9 7 2)) 
  )
)

(run-tests tests 'verbose)
