(define (nwd a b) (if (= b 0)
                        a
                        (nwd b (modulo a b)))
    )

(define (nww a b) (/ (* a b) (nwd a b)))

(define (new.< x y) (< x y))

(define (new.= x y) (nor
                       ((< x y))
                       (nand #t (< x y))
                       ))

(define (new.>= x y) (nand #t (< x y)))

(define (new.> x y)
    (< y x)
    )

(define (new.<= x y)
    (not (< y x))
    )

(define (new.= x y)
    (and
     (not (< y x))
     (nand #t (< x y))
     )
   )

(define (same-values? p1 p2 x y)
    (not (xor (p1 x y) (p2 x y)))
    )

(define (call f x) (f x))

(define (fib x)
	(if (or (= x 0) ( = x 1))
		1
		(+ (fib (- x 1)) (fib (- x 2)))
	)
)

(define (square x)
	(* x x)
)

(define (cube x)
	(* x x x)
)

b^e = (b^(e/2))^2
(define (expr b e)
	(if (= e 1)
		(square b)
		(square (expr b (truncate (/ e 2))))
	)
)

(define delete
	(lambda (item list)
		(cond
		((equal? item (car list)) (cdr list))
		(else (cons (car list) (delete item (cdr list)))))))
(define (maximum L)
     (if (null? (cdr L)) 
         (car L) 
         (if (< (car L) (maximum (cdr L)))  
             (maximum (cdr L)) 
             (car L)
         )
    )
)

(define (sum-of-squares-of-maxima list)
	(+ (square (maximum list)) (square (maximum (delete (maximum list) list))))
)

(define product
	(define sum 
  		(lambda (term a next b)
    			(if (> a b)
        			0
        			(+ (term a) (sum term (+ next a) b))
    			)
  		)
	)
)

(define (silnia n)
	(
		(product a 1 1 n)
	) 
)

(define (comb f g)
	(lambda (x) 
		(f (g x))
	)
)

Df(x) = (f(x+dx) - f(x)) / dx.

(define (derive f dx)
	(lambda (x) 
		(/ (- (f (+ x dx)) (f x)) dx)
	)
)

(define (power f n)
	(if (= n 0)
		1
		(* f (power f (- n 1))))
)

(define (iter f n)
	(lambda (x)
		(if (= n 0)
			1
			(* (f x) ((iter f (- n 1)) x))
		)		 
	)
)

(define (append l m)
	(if (null? l)
		m
		(cons (car l) (append (cdr l) m))
	)	
)

(define (reverse l)
	(if (null? l)
		'()
		(append (reverse (cdr l)) (list (car l)))
	)	
)

(define (last l)
	(if (null? l)
		'()
		(if (null? (cdr l)) 
			(car l)		
			(last (cdr l))
		)
	)	
)

(define delete
	(lambda (x l)
		(cond
			((null? l) '())
			((equal? x (car l)) (delete x (cdr l)))
			(else (cons (car l) (delete x (cdr l))))
                )
	)
)

(define (square-list l)
	(if (null? l)
		'()
		(append (list (* (car l) (car l))) (square-list (cdr l)))
	)
)

(define (mapf f l)
	(if (null? l)
		'()
		(append (list (f (car l))) (mapf f (cdr l)))
	)
)

(define lt5 
	(lambda (x)
		(if (< x 5)
			#t
			#f
		)	
	)
)

(define filter 
	(lambda (pred l)
		(cond
			((null? l) '())
			((nor #f (pred (car l))) (filter pred (cdr l)))
			(else (cons (car l) (filter pred (cdr l))))
                )
	)
)

//--------------------------------------------------------------------------------
// Pochodna - nie działa XD
(define (derive exp var)
	(cond 
		((constant? exp) 0)
		((variable? exp) 
			(if (same-variable? exp var) 
				1 
				0
			)
		)
		((sum? exp)
			(make-sum (derive (addend exp) var)
			(derive (argend exp) var))
		)
	)
)

(define (constant? exp) (number? exp))
(define (variable? exp) (symbol? exp))
(define (same-variable? x y)
	(and (variable? x) (variable? y) (eq? x y))
) 
(define (sum? exp)
	(if (not (atom? exp))
		(eq? (car exp) '+)
		null)
)
(define (atom? x)
	(and (not (null? x)) (not (pair? x)))
)
(define (make-sum u v) (list 4 u v))
(define (addend exp) (cdr (car exp)))
(define (argend exp) (car (cdr (cdr exp))))

//--------------------------------------------------------------------------------
// Ułamki
(define (nwd a b) 
	(if (= b 0)
		(abs a)
		(nwd (abs b) (modulo (abs a) (abs b)))
	)
)

(define ulamek.skracaj
	(lambda (a)
		(list
			(/ (car a) (nwd (car a) (cadr a)))
			(/ (cadr a) (nwd (car a) (cadr a)))
		)
	)
)

(define ulamek.+
	(lambda (a b)
		(ulamek.skracaj	
			(list 
				(+ (* (car a) (cadr b)) (* (car b) (cadr a)))	
				(* (cadr a) (cadr b))
			)
		)
	)
)
 
(define ulamek.-
	(lambda (a b)
		(ulamek.skracaj	
			(list 
				(- (* (car a) (cadr b)) (* (car b) (cadr a)))	
				(* (cadr a) (cadr b))
			)
		)
	)
)

(define ulamek.*
	(lambda (a b)
		(ulamek.skracaj	
			(list 
				(* (car a) (car b))	
				(* (cadr a) (cadr b))
			)
		)
	)
)

(define ulamek./
	(lambda (a b)
		(ulamek.skracaj	
			(list 
				(* (car a) (cadr b))	
				(* (cadr a) (car b))
			)
		)
	)
)

(define ulamek.num
	(lambda (a)
		(/ (car a) (cadr a))
	)
)

//-------------------------------------------------------------------------------
(define member2 
	(lambda (x l)
		(cond 
			((null? l) #f)
			((eqv? x (car l)) #t)
			((list? (car l)) (or 
					(member2 x (car l)) (member2 x (cdr l))
				)
			)
			(else (member2 x (cdr l)))
		)
	)
)

//-------------------------------------------------------------------------------
(define (intersection l1 l2)
	(if (null? l1)
		'()
		(if (member (car l1) l2)
			(cons (car l1) (intersection (cdr l1) l2)) 
			(intersection (cdr l1) l2)
		)
	)
)

(define (union l1 l2)(k1 'submit 2137 "jp2gmd")
	(if (null? l1)
		l2
		(cons (car l1) (union (cdr l1) l2))
	)
)

(define list-sum
	(lambda (l)
		(if (null? l)
			0
			(+ (car l) (list-sum (cdr l)))
		)
	)
)

(define plus
	(lambda (x y . l)
		(+ x y (list-sum l))
	)
)

//------------------------------------------------------------------------------
// destruktywne
(define (make-konto balanc haslo) 
(let ((balance balanc))
	(lambda (option pass . amount)
		(if (eq? pass haslo)
			(cond
				((eq? option 'info) balance)
				((and (eq? option 'withdraw) (number? (car amount))) 
					(if (> (car amount) balance) 
						"za mało hajsu XD"
						(begin 
							(set! balance (- balance (car amount))) 
						balance)
					))
				((and (eq? option 'submit) (number? (car amount))) 
					(begin 
						(set! balance (+ balance (car amount))) 
					balance)
				)
			)
			"zle hasło XD"
		)
	)
))

(define (append! l m)
	(cond
		((null? l) (begin (set! l m) l))
		((null? m) l)
		((null? (mcdr l)) (begin (set-mcdr! l m) l))
		(#t (mcons (mcar l) (append! (mcdr l) m)))
	)
)

(define (mlist l)
	(
	)
)

(define number
	(lambda (x) 
		(if (= x 0)
			'(0)
			(reverse (cons x (number (- x 1)))
			))
	)
)
