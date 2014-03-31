#!/usr/bin/env vesta

(define (substring? source subst (idx 0) (sidx 0))
    ;; this is the naieve version. a better one would
    ;; have an inner procedure to handle the actual
    ;; iteration, and this top-level one would simply
    ;; handle the setup thereof.
    (cond
        (= (length subst) (length source))
            (eq? source subst)
        (> (length subst) (length source))
            #f
        (>= sidx (length subst)) ;; reached the end of the substring?
            #t
        (>= idx (length source)) ;; reached the end of the string?
            #f
        (eq? (nth source idx) (nth subst sidx))
            (substring? source subst (+ idx 1) (+ sidx 1))
        else
            (substring? source subst (+ idx 1) 0)))

(define (runner lst) ;; could be replaced by a `foreach`, but whatev's, it's midnight
    (if (null? lst)
        #v
        (let ((str (caar lst)) (sub (cadar lst)))
            (display (format "is ~S a substring of ~S? ~a~%" sub str (substring? str sub)))
            (runner (cdr lst)))))

(runner '(("foo" "foo") ("foot" "foo") ("hamsterfoot" "foo") ("hamsterfoo" "foo") ("nothing fo you" "foo")))
