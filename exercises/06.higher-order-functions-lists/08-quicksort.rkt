#lang racket
(require rackunit)
(require rackunit/text-ui)
 
; Искаме да сортираме списък от числа по метода quicksort
(define (quicksort xs)
  (void))

(define tests
  (test-suite "Generic sort tests"
    (letrec (
             (original-list '(32 39213 2813 8321 921 23))
             (sorted-list (quicksort original-list))
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
