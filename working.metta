;(=(AND $x) (cons-atom AND $x))
;(=(OR $x) (cons-atom OR $x))
;(= ( NOT ($x)) (cons-atom NOT $x))
;; Propagate to childrens for both (propagateNot NOT) and (propagateNot logic)
(=(propagateNotChildrens () $tuple) (collapse (propagateNot (superpose $tuple))))
(=(propagateNotChildrens $tuple) (collapse (propagateNot NOT (superpose $tuple))))

;; Rules
;(= (propagateNot AND $tuple) (AND (propagateNotChildrens () $tuple)))
;(= (propagateNot OR $tuple) (OR  (propagateNotChildrens () $tuple)))
;(= (propagateNot NOT AND $tuple) (OR (propagateNotChildrens $tuple)))
;(= (propagateNot NOT OR $tuple) (AND (propagateNotChildrens $tuple)))
;(= (propagateNot NOT NOT $tuple) (propagateNot $tuple))



(=(propagateNot $expr ()) (propagateNot $expr))
(=(propagateNot $expr)
  (case $expr
        (
            ( (AND $tuple) (AND (propagateNotChildrens () $tuple)))
            ( (OR $tuple) (OR (propagateNotChildrens () $tuple)))
            ( (NOT AND $tuple) (OR (propagateNotChildrens $tuple)))
            ( (NOT OR $tuple) (AND (propagateNotChildrens $tuple)))
            ( (NOT NOT $tuple) (propagateNot $tuple))
            ( (NOT $symbol) (NOT $symbol))
            ( $symbol  (
               if (== (get-metatype $symbol) Expression)
                  (propagateNot ( (car-atom $symbol) (cdr-atom $symbol)))
                  $symbol
            ))
           
        )
  )
)

;!(propagateNot (AND (NOT (OR A B)) (NOT (AND C D E)) (OR A B) A B))
(AND (AND (NOT A) (NOT B)) (OR (NOT C) (NOT D) (NOT E)) (OR A B) A B)

!(propagateNot (AND (A B)))
!(propagateNot (OR (a b)))
!(propagateNot (NOT AND (A B)))
!(propagateNot (NOT OR (A B)))
;!(propagateNot (NOT NOT (A B)))
;!(propagateNot (NOT A))
;!(propagateNot A)
;!(propagateNot (And A B))