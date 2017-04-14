#!/usr/bin/guile -s 
!#

(define *M* 999)

(define (palindrome? ns)
  (define (palindrome? s)
    (equal? (string-reverse s) s))
  (palindrome? (number->string ns)))

(define (main i j)
  (cond 
    ((= i 0) (main *M* (- j 1)))
    ((palindrome? (* i j)) (list i j (* i j)))
    (else (main (- i 1) j))))

(display (main *M* *M*))
