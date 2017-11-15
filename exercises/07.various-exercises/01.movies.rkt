#lang racket

(define movies '(
  ("Fight Club" 8.8 1999)
  ("Requiem for a Dream" 8.3 2000)
  ("The Ladykillers" 6.2 2004)
  ("Juno" 7.5 2007)
  ("Watchmen" 7.6 2009)
  ("Scott Pilgrim vs. the World" 7.5 2010)
  ("Tangled" 7.8 2010)
  ("Moonrise Kingdom" 7.8 2012)
  ("The Perks of Being a Wallflower" 8.0 2012)
  ("Hotel Transylvania" 7.1 2012)
  ("The Spectacular Now" 7.1 2013)
  ("Rush" 8.1 2013)
  ("A Long Way Down" 6.4 2014)
  ("Guardians of the Galaxy" 8.1 2014)
  ("A Man Called Ove" 7.7 2015)
))

; Искаме заглавията на всички филми, с рейтинг >= 8
(define first (void))

; Искаме годината на излизане на най-новия филм с рейтинг >= 8
(define second (void))

; Искаме рейтингите на всички филми, които имат "u" в името си.
; (string-contains? str search) ни казва дали str съдържа search (и двата аргумента са низове).
(define third (void))

; Искаме годината на излизане на филма с най-дълго заглавие
(define fourth (void))