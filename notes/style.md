# Как да пишем четим код на Racket

Няколко препоръки относно стил, които (се старая да) спазвам.

## 1. Имена на дефиниции

1.1 Имената трябва да говорят за това, с което са свързани

**Ok:**
```Racket
(define (count-digits number)
  (void)
)
; В този случай лесно се разбира, че процедурата връща броя цифри в число.

(define (substring? string test)
  (void)
)
; Тук например проверяваме дали test е подниз на string. test е това, което проверяваме.
```

**Not ok:**
```Racket
(define (proc a b)
  (void)
)
; wut?

(define (my-func x y sum)
  (void)
)
; Тук единят параметър (sum) има някакво смислено име, но няма никакъв контекст, в който да го сложим.
; -> wut?
```

1.2 Хубаво е имената да са кратки и ясни. Дългите имена са ОК, само ако няма как да синтезирате същината на процедурата в достатъчно малко символи.

**Ok:**
```Racket
(define (sum-interval start end)
  (void)
)
```

**Not ok:**
```Racket
(define (sum-of-integer-interval interval-start interval-end)
  (void)
)
```

1.3. Използваме [Kebab case](http://wiki.c2.com/?KebabCase) за именоване. Стараем се да сме консистентни с него.

**Ok:**
```Racket
(define (get-movie-rating movie)
  (void)
)

(define (checkout cart-items)
  (void)
)
```

**Not ok:**
```Racket
(define (getMovieRating Movie)
  (void)
)

(define Pi 3.14)
```

1.4. Ако процедурата връща булева стойност (тоест е предикат), името ѝ да завършва с `?`. Така завършват вградените в езика предикати.

**Ok:**
```Racket
(define (prime? number)
  (void)
)

(define (substring? string test)
  (void)
)

; Съществуващи дефиниции в езика;
(odd? 5) ; #t
(equal? 2 (- 4 2))
```

1.5. Ако процедурата ни е мутатор, името ѝ да завършва с `!`. Така завършват вградените в езика мутатори.

**Ok:**
```Racket
(define (pop! stack)
  (void)
)

; Съществуваща дефиниция в езика:
(set-car! pair new-car)
```
