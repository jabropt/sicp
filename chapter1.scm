(use slib)
(require 'trace)

; Ex.1.1
(define a 3)
(define b (+ a 1))
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4)(+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a ))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))


; Ex.1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)) )

; Ex.1.3
(define (sum-square-max-two a b c)
  (cond ((and (> a c) (> b c)) (+ (* a a)(* b b)))
         ((and (> a b) (> c b)) (+ (* a a)(* c c)))
         ((and (> b a) (> c a)) (+ (* b b)(* c c)))
         ))

(define (sum-square x y)
  (+ (* x x) (* y y)))
(define (sum-square-max-two2 a b c)
  (cond ((and (> a c) (> b c)) (sum-square a b))
        ((and (> a b) (> c b)) (sum-square a c))
        ((and (> b a) (> c a)) (sum-square b c))
        ))

; Ex.1.5
;; (define (p) (p))

;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y))

;; (trace (test 0 (p)))
;; 作用的順序では、無限ループ。正規順序では、0が返る。

;; Newton法による平方根
;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))

;; (define (improve guess x)
;;   (avarage guess (/ x guess)))

;; (define (avarage x y)
;;   (/ ( + x y) 2))

;; (define (good-enough? guess x)
;;   (< (abs(- (square guess) x)) 0.001))

;; (define (sqrt x)
;;   (sqrt-iter 1.0 x))

Ex.1.6

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;; 処理が終わらない。new-ifはifやcondなどの特殊形式と違い、ただの手続きなので、
;; 実行時、作用的順序により、まず引数が評価される。その後もnew-ifを呼ぼうとするが、
;; 引数が評価される繰り返しとなり、new-ifが呼ばれることはない
