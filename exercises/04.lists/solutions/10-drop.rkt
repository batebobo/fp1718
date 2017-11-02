#lang racket
(require rackunit)
(require rackunit/text-ui)

; Търсим функция, която връща списък от всички без първите n елемента на даден такъв.

(define (append xs ys)
  (if (null? xs)
     ys
     (cons (car xs) (append (cdr xs) ys)))
)

(define (reverse xs)
  (if (null? xs)
     '()
     (append (reverse (cdr xs)) (list (car xs)))
  )
)

(define (length xs)
  (define (helper xs size)
    (if (null? xs)
       size
       (helper (cdr xs) (+ size 1))
    )
  )
  (helper xs 0)
)

;тук и двете функции drop работят просто за втория вариант се сетих в последствие решавайки последната задачая

;(define (drop n xs)
;  (define (helper n xs-reverse)
;    (if(< n 0)
;       '()
;       (if(or (= n 0)
;              (null? xs-reverse))
;          '()
;          (append  (helper (- n 1) (cdr xs-reverse)) ( list(car xs-reverse)))
;          )
;    )
;    )
;    (helper (- (length xs) n) (reverse xs))
;)

(define (drop n xs)
  (cond ((null? xs) '())
        ((= n 0) (cons (car xs) (drop n (cdr xs))))
        (else (drop (- n 1) (cdr xs)))))

(define tests
  (test-suite "Take tests"
     (check-equal? (drop 2 '(1 2 3 4)) '(3 4))
     (check-equal? (drop 0 '(2 9 2)) '(2 9 2))
     (check-equal? (drop 2134 '(9 7 2 3)) '())
  )
)

(run-tests tests 'verbose)
