#lang racket
(require rackunit)
(require rackunit/text-ui)
(provide filter-tests)
 
; Дефинирайте функцията от по-висок ред filter
; Тя приема за аргументи едноместен предикат и списък
; Връща като резултат списък от всички елементи на оригиналния,
; които удовлетворяват предиката
; Тоест: (filter odd? '(1 2 3)) -> '(1 3)

(define (filter p? xs)
  (void)
)

(define filter-tests
  (test-suite "Filter tests"
     (check = (length (filter odd? (range 1 101))) (/ (length (range 1 101)) 2))
     (check-equal? (filter (lambda (x) (string-contains? x "ed")) '("qed" "what" "education")) '("qed" "education"))
     
     (letrec ((sum-digits (lambda (n)
                         (if (< (abs n) 10)
                             n
                             (+ (remainder n 10) (sum-digits (quotient n 10)))))))

       (check-equal? (filter (lambda (x) (> (sum-digits x) 15)) '(123 99 1455 7531 821 934)) '(99 7531 934)))
  )
)

(run-tests filter-tests)
