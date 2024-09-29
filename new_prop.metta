(=(propagateChildrens $tuple) (collapse (propagateNot (superpose $tuple))))
(=(propagateNotChildrens $tuple) (collapse (propagateNot NOT (superpose $tuple))))
(=(propagateNot NOT $expr)

    (propagateNot NOT (car-atom $expr) (cdr-atom $expr))

)
(=(popNOTOR $tuple) ( propagateNot NOT (superpose $tuple)))
(=(propagateNot NOT $expr ())
  (propagateNot NOT (car-atom $expr) (cdr-atom $expr))
)
(= (propagateNot NOT OR $tuple) (let $x (popNOTOR $tuple) (AND $x)))
(= (propagateNot AND $tuple) (let $res (propagateChildrens $tuple) (AND $res)))

(=(propagateNot $expr) 
 (
    if (== (get-metatype $expr) Expression)
       (
        let* (
                ($op (car-atom $expr)) 
                ($tuple (cdr-atom $expr))
            )
         (propagateNot $op $tuple)
       ) 
       $expr
 )
)

!(propagateNot (AND (NOT (OR (AND G F E) D C)) B A))
