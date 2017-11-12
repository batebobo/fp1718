#lang racket
(require rackunit)
(require rackunit/text-ui)
(provide map-tests)

; Дефинирайте функцията от по-висок ред map
; Тя очаква като аргументи функция и списък
; Като резултат връща нов списък като върхъ всеки елемент от
; дадения е приложена функцията
; Тоест: (map f (el1 el2 el3 ... elk)) -> ((f el1) (f el2) ... (f elk))

(define (map f xs)
  (void)
)


(define map-tests
  (test-suite "Map tests"
    
    (check-equal? (map - '(1 2 3 4)) '(-1 -2 -3 -4))
    (check-equal? (map (lambda (x) (* x x)) '(1 2 3 4)) '(1 4 9 16))
    (check-equal? (map (lambda (x) (odd? x)) '(9 28173 8 2 75)) '(#t #t #f #f #t))

    (check-equal? (map (lambda (x) (car x)) '((1 2 3) (4 5 6) (7 8 9))) '(1 4 7))
    (check-equal? (map (lambda (x) (string-length x)) '("Woow" "this" "is" "a" "list" "of" "strings")) '(4 4 2 1 4 2 7))
    (check-equal? (map (lambda (x) (cons x '())) '(1 2 3)) '((1) (2) (3)))
  )
)

(run-tests map-tests)
