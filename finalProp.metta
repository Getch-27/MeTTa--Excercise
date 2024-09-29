(=(AND $x) (cons-atom AND $x))
(=(OR $x) (cons-atom OR $x))
(=(isExpression $tuple) (
   if(== (get-metatype $tuple) Expression)
     True
     False
))

(=(propagateChildrens $tuple) (collapse (propagateNot (superpose $tuple))))
(=(propagateNotChildrens $tuple) (collapse (propagateNot NOT (superpose $tuple))))

(= (propagateNot AND $tuple) (let $res (propagateChildrens $tuple) (AND $res)))
(= (propagateNot OR $tuple) (let $res (propagateChildrens $tuple) (OR $res)))
(= (propagateNot NOT AND $tuple) (let $res (propagateNotChildrens $tuple) (OR $res)))
(= (propagateNot NOT OR $tuple) (let $res (propagateNotChildrens $tuple) (AND $res)))
(= (propagateNot NOT NOT $tuple) (propagateNot $tuple))

(=(propagateNot NOT $expr)(
    if(isExpression $expr)
       (let $x (car-atom $expr) 
       (if(isExpression $x)
          (propagateNot NOT (car-atom $x) (cdr-atom $x))
          (propagateNot NOT $x (cdr-atom $expr))
         ))
       (NOT $expr)
))

(=(propagateNot $expr) 
 (
    if (isExpression $expr)
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

 !(propagateNot (NOT (OR (AND G  E) D)))