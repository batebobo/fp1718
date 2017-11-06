#lang racket
(require rackunit)
(require rackunit/text-ui)

; Ще сортираме списък по метода на пряката селекция.
; За тази цел започваме с дефиниции на спомагателни функции.

; Намира най-малкото число в списъка

(define (minimum xs)
  (define (helper xs min)
    (if (null? xs)
       min
       (if (< (car xs) min)
          (helper (cdr xs) (car xs))
          (helper (cdr xs) min)
          )
       )
    )
  (helper xs (car xs))
)

; Връща списъка xs без първото срещане на x в него
(define (remove x xs)
  (if (= (car xs) x)
     (cdr xs)
     (cons (car xs) (remove x (cdr xs)))
     )
)

; Самият selection sort:
(define (selection-sort xs)
  (if (null? xs)
     '()
     (cons (minimum xs) (selection-sort (remove (minimum xs) xs))))
)

(define tests
  (test-suite "Selection sort"
    (letrec (
             (original-list '(32 39213 2813 8321 921 23))
             (sorted-list (selection-sort original-list))
             (same-lengths? (lambda (xs ys) (= (length xs) (length ys))))
             (same-elements?
              (lambda (xs ys)
                (cond ((null? xs) #t)
                      ((not (member (car xs) ys)) #f)
                      (else (same-elements? (cdr xs) ys)))))
             (increasing?
              (lambda (xs)
                (cond ((null? (cdr xs)) #t)
                      ((< (car xs) (cadr xs)) (increasing? (cdr xs)))
                      (else #f))))
            )
                        
      (check-true (same-lengths? original-list sorted-list))
      (check-true (same-elements? original-list sorted-list))
      (check-true (increasing? sorted-list)))
  )
)

(run-tests tests 'verbose)