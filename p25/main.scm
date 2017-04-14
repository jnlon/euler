#!/usr/bin/guile -s
!#

(define *DESIRED-LENGTH* 1000)

(define (fib-length r1 r2)
  (string-length 
    (number->string (+ r1 r2))))

(define (fib-desired-len? r1 r2)
  (>= (fib-length r1 r2) 
      *DESIRED-LENGTH*))

(define (main i r1 r2)
  (if (fib-desired-len? r1 r2) 
    i
    (main (1+ i) r2 (+ r1 r2))))

(display (main 1 1 0))
