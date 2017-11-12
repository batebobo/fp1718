#lang racket
(require rackunit)
(require rackunit/text-ui)
(provide fold-left)
 
; Искаме да комбинираме всички елементи на списък в една резултатна стойност
; Като accumulate, само че вместо числов интервал, работим със списък
; Хубаво е да направим този fold итеративно, като натрупваме в null-value

(define (fold-left op null-value xs)
  (void)
)

; При добро желание, може да го накараме да прави рекурсивен процес:
(define (fold-left-rec op null-value xs)
  (void)
)

(define fold-left-tests
  (test-suite "Fold-left tests"
    (check-equal? (fold-left / 1 '(1 2 3 4 5)) 1/120)
    (check-equal? (fold-left * 1 '(1 2 3 4 5)) 120)
    (check-equal? (fold-left (lambda (acc current) (cons current acc)) '() '(1 2 3)) '(3 2 1))

    ; Бонус тест: искаме да конкатенираме списък от низове в един.
    ; За тази цел първо да дефинираме функция, която приема списък от низове и добавя по
    ; един интервал след всеки
    ; след това може да видите как се конкатенират с fold-left

    (let* ((add-whitespaces (lambda (string-list)
           ; string-append конкатенира два низа
           (map (lambda (string) (string-append string " ")) string-list)))
           ; Тоест искаме от '("a" "wow" "d") -> '("a " "wow " "d ")
           (whitespaced-list (add-whitespaces '("I" "am" "going" "to" "be" "a" "sentence")))
           ; whitespaced-list е '("I " "am " "going " ...)
           (sentence (fold-left (lambda (acc current) (string-append acc current)) "" whitespaced-list)))

      (if (not (null? sentence))
          ; string-trim премахва whitespace символи в началото и края на даден низ
          ; това ни е необходимо, тъй като заради add-whitespaces, добавяме интервал след последната дума.
          (check-equal? (string-trim sentence) "I am going to be a sentence")
          (void)))

    ; Тук кръщаваме резултатите от извикванията на двете функции
    ; Тъй като може да не си играете да пишете рекурсивната версия,
    ; пускаме теста, само ако сте я дефинирали.
    ; Иначе показваме подканващо съобщение
    (let ((recursive-result (fold-left-rec / 1 '(1 2 3 4 5)))
          (iterative-result (fold-left / 1 '(1 2 3 4 5))))
      (if (not (void? recursive-result))
          (check-equal? recursive-result iterative-result)
          (display "Define the recursive version as well pls\n")))
  )
)

(run-tests fold-left-tests 'verbose)
