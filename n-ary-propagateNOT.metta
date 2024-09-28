; (: propagateNot (-> $expr $expr))

(=(propagateChildrens $tuple) 
    (collapse 
       (propagateNot (superpose $tuple))
    )
)
(= (propagateNot $tuple) (
    if (== (get-metatype $tuple) Expression)
       (extract $tuple) 
       $tuple
    )
)

(=(propagateNot NOT ($tuple)) (propagateNot NOT (car-atom $tuple) (cdr-atom $tuple))) 
(= (propagateNot NOT AND $tuple) (let $res (propagateChildrens $tuple) (OR $res)) )
(= (propagateNot NOT OR $tuple) (let $res (propagateChildrens $tuple) (AND $res)))
(= (propagateNot NOT NOT $tuple) (extract $tuple))
(=(propagateNot NOT $tuple) 
    (if (== (get-metatype $tuple) Expression)
       (extract $tuple) 
       (NOT $tuple)
))

(= (propagateNot AND $tuple) (let $res (propagateChildrens $tuple) (AND $res)))
(= (propagateNot OR $tuple) (let $res (propagateChildrens $tuple) (OR $res)))


(= (extract $expr)
    (let* (
                ($op (car-atom $expr)) 
                ($tuple (cdr-atom $expr))
            )
         (propagateNot $op $tuple)
    )
)

;; Example usage with n-ary expressions:
;! (propagateNot (NOT (AND (NOT (OR (AND G F E) D C)) B A)))
! (extract (AND (NOT (OR (AND G F E) D C)) B A))

;(AND ((NOT (OR (AND G F E) D C)) B A))









;(=(propagateNot NOT ($tuple))
;  (propagateNot NOT (car-atom $tuple) (cdr-atom $tuple))
;) 


;(= (propagateNot NOT OR $tuple)
; (AND (propagateNot NOT (car-atom $tuple)) (propagateNot NOT (cdr-atom $tuple)))
;)
