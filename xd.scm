(define (flatten1 x)
  (cond ((null? x) '())
        ((pair? x) (append (flatten1 (car x)) (flatten1 (cdr x))))
        (else (list x))))


(define (numbers n)
	(define numb
		(lambda (n)
			(if (= n 0)
				'(0)
				(cons n (numb (- n 1)))
				)
			)
		)
	(reverse (numb n))
)
