#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме функция, която приема списък и две числа и връща
; списък, състоящ се от елементите на списъка, които се намират на индекси от първото число до второто.

(define (between? x start end) (and (>= x start) (<= x end)))

; Рекурсивен вариант без помощна функция
(define (slice-rec xs start end)
  (cond ((null? xs) '())
        ((and (= start 0) (<= 0 end))
         (cons (car xs) (slice (cdr xs) start (- end 1))))
        (else (slice (cdr xs) (- start 1) (- end 1)))))

; Рекурсивен вариант с помощна функция
(define (slice-rec-help xs start end)
  (define (helper xs start end counter)
    (cond ((or (null? xs) (> start counter)) '())
          ((between? counter start end)
           (cons (car xs) (helper (cdr xs) start end (+ counter 1))))
          (else (helper (cdr xs) start end (+ counter 1)))))
  (helper xs start end 0))

; Итеративен вариант
(define (slice-iter xs start end)
  (define (helper xs start end counter result)
    (cond ((or (null? xs) (< counter start)) result)
          ((between? counter start end)
           (helper (cdr xs) start end (+ counter 1) (append result (list (car xs)))))
          (else (helper (cdr xs) start end (+ counter 1) result))))
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
