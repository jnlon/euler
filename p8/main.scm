#!/usr/bin/guile -s
!#

(import (ice-9 rdelim)
        (ice-9 pretty-print))

(define *DATA-FILE* "data.txt")
(define *SLICE-SIZE* 13)

(define (slurp-line filename)
  (with-input-from-file filename read-line))

(define (make-slices str sz)
  (map 
    (lambda (start) 
      (substring str start (+ start sz)))
    (iota (- (string-length str) sz -1))))

(define (productify s)
  (apply * 
    (map string->number 
      (map string (string->list s)))))

(display
  (apply max
    (map productify
      (make-slices 
        (slurp-line *DATA-FILE*) 
        *SLICE-SIZE*))))
