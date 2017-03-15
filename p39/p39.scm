#!/usr/bin/guile -s
!#

(import (ice-9 pretty-print)
        (ice-9 rdelim)
        (srfi srfi-1))

(define *MAX* 1000)

(define (ab->c a b)
  (sqrt (+ (expt a 2) (expt b 2))))

(define (make-abc a b c)
  (let ((s (+ a b c)))
    (if (and (< s *MAX*) )
      (list s a b c)
      #f)))

(define (sqrtable? a b)
  (exact? (ab->c a b)))

(define (a->abc a)
  (filter list? 
    (map (lambda (b) (make-abc a b (ab->c a b))) 
         (filter (lambda (b) (sqrtable? a b)) (iota a 1)))))

(define *AB* (concatenate (map a->abc (iota *MAX* 1))))
(define *PVALS* (map car *AB*))

(define (make-count-p-pair p)
  (cons (count (lambda (e) (= e p)) *PVALS*) p))

(define (sort-by-first-desc a b)
  (> (car a) (car b)))

(define count-ab 
  (sort
    (map make-count-p-pair *PVALS*)
    sort-by-first-desc))

(write-line (cdar count-ab))
