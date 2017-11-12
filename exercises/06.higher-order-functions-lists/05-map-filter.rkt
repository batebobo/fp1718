#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "01-map.rkt")
(require "02-filter.rkt")
(require "03-fold-left.rkt")
(require "04-fold-right.rkt")

; Дефинирайте filter въз основа на fold-right
(define (filter p? xs)
  (void)
)

; Дефинирайте map въз основа на fold-left
(define (map f xs)
  (void)
)

(display "ACTUAL TESTS-----------------------------------------------------------\n")
(run-tests map-tests 'verbose)
(run-tests filter-tests 'verbose)