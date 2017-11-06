#lang racket
(define (product start end step)
  (if(> start end)
     1
     (* start (product (step start) end step))))

(define (accumulate op null-value start end term next)
  (if(> start end)
     null-value
     (op start (accumulate op null-value (next start) end term next))))

(define (fact n)
  (accumulate * 1 1 n  (lambda (x) x)  (lambda (x) (+ x 1)))
  )