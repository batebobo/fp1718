#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме функция, която приема списък и две числа и връща
; списък, състоящ се от елементите на списъка, които се намират на индекси от първото число до второто.

;(define (slice xs start end)
;  (define (helper xs start end counter)
;    (if(null? xs)
;       '()
;       (if(and (>= counter start)
;               (<= counter end))
;          (cons (car xs) (helper (cdr xs) start end (+ counter 1)))
;          (if(< counter start)
;             (helper (cdr xs) start end (+ counter 1))
;             '()
;             )
;          )
;    )
;  )
;  (helper xs start end 0)
;)

;(define (slice xs start end)
;    (if(null? xs)
;       '()
;       (if(and (= start 0)
;               (<= 0 end))
;          (cons (car xs) (slice (cdr xs) start (- end 1)))
;          (if(< 0 start)
;             (slice (cdr xs) (- start 1) (- end 1))
;             '()
;             )
;          )
;    )
;)

(define (append xs ys)
  (if(null? xs)
     ys
     (cons (car xs) (append (cdr xs) ys)))
)

(define (slice xs start end)
  (define (helper xs start end counter result)
    (if(null? xs)
       result
       (if(and (>= counter start)
               (<= counter end))
          (helper (cdr xs) start end (+ counter 1) (append result (list (car xs)) ))
          (if(< counter start)
             (helper (cdr xs) start end (+ counter 1) '())
             result
             )
          )
    )
  )
  (helper xs start end 0 '())
)



(define tests
 (test-suite "Slice tests"
     (check-equal? (slice '(1 9 8 2) 1 2) '(9 8))
     (check-equal? (slice '(1 9 2 8 3) 2 10) '(2 8 3))
     (check-equal? (slice '(9 7 2 3) 0 2) '(9 7 2)) 
  )
)

(run-tests tests 'verbose)
