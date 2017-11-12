#lang racket
(require rackunit)
(require rackunit/text-ui)
 
; Искаме да намерим най-малкото число в списък, използвайки fold-left или fold-right
(define (minimum xs)
  (void))

(define tests
 (test-suite "Min tests"
   (letrec (; create-random-list прави списък от случайни числа с дължина len
            (create-random-list (lambda (len)
             (if (= len 0)
                 '()
                 ; random прави случайно число до аргумента си
                 (cons (random 213939219) (create-random-list (- len 1))))))
            ; Създаваме си случаен списък с 235 елемента
            (random-list (create-random-list 235))
            ; Взимаме най-малкия елемент от него
            (minimum-of-random-list (minimum random-list))
            ; Това го знаем
            (any? (lambda (p? xs)
              (cond ((null? xs) #f)
                    ((p? (car xs)) #t)
                    (else (any? p? (cdr xs)))))))
     ; Казваме, че не съществува елемент от random-list, който е по-малък от минимума, който сме намерили
     (check-true (not (any? (lambda (x) (< x minimum-of-random-list)) random-list))))
 )
) 

(run-tests tests 'verbose)
