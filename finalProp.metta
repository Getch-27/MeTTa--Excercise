(=(AND $x) (cons-atom AND $x))
(=(OR $x) (cons-atom OR $x))

;; function to check metatype
(=(isExpression $tuple) (
   if(== (get-metatype $tuple) Expression)
     True
     False
))

;; Propagate to childrens for both (propagateNot NOT) and (propagateNot logic)
(=(propagateChildrens $tuple) (collapse (propagateNot (superpose $tuple))))
(=(propagateNotChildrens $tuple) (collapse (propagateNot NOT (superpose $tuple))))

;; Rules
(= (propagateNot AND $tuple) (let $res (propagateChildrens $tuple) (AND $res)))
(= (propagateNot OR $tuple) (let $res (propagateChildrens $tuple) (OR $res)))
(= (propagateNot NOT AND $tuple) (let $res (propagateNotChildrens $tuple) (OR $res)))
(= (propagateNot NOT OR $tuple) (let $res (propagateNotChildrens $tuple) (AND $res)))
(= (propagateNot NOT NOT $tuple) (propagateNot $tuple))

(=(propagateNot NOT $symbol ()) (NOT $symbol))
(=(propagateNot NOT $expr)
  (if(isExpression $expr)
     (let $x (car-atom $expr) 
       (if(isExpression $x)
          (propagateNot NOT (car-atom $x) (cdr-atom $x))
          (propagateNot NOT $x (cdr-atom $expr))
       )
      )
      (NOT $expr)
))
(=(propagateNot $expr ()) (propagateNot $expr))
(=(propagateNot $expr) 
  (
    if (isExpression $expr)
       ( let* (
                ($op (car-atom $expr)) 
                ($tuple (cdr-atom $expr))
              )
              (propagateNot $op $tuple)
       ) 
       $expr
  )
)

!(propagateNot (AND (NOT (OR (AND G F E) D C)) B A))

!(propagateNot (NOT (G  E)))

!(assertEqual
    (propagateNot (OR (AND A B) (OR A C)))
    (OR (OR C A) (AND B A))
)
!(assertEqual
    (propagateNot (AND A B))
    (AND B A)
)
!(assertEqual
    (propagateNot (NOT A))
    (NOT A)
)
!(assertEqual
    (propagateNot (OR A (AND B C)))
    (OR (AND C B) A )
)
!(assertEqual
    (propagateNot (NOT (OR A (AND B C))))
    (AND  (OR  (NOT C) (NOT B) ) (NOT A))
)

!(assertEqual
    (propagateNot (NOT (AND A (OR B C))))
    (OR (AND (NOT C) (NOT B)) (NOT A))
)
!(assertEqual
    (propagateNot (AND A (NOT (OR B (AND C D)))))
    (AND (AND (OR (NOT D) (NOT C)) (NOT B)) A)
)

!(assertEqual
    (propagateNot (NOT (AND A (NOT (OR B (AND C D))))))
    (OR (OR (AND D C) B) (NOT A))
)

!(assertEqual
    (propagateNot (AND A (OR B (AND C D))))
    (AND (OR (AND D C) B) A)
)
!(assertEqual
    (propagateNot (NOT (NOT (NOT (NOT (AND A (AND B (AND C D))))))))
    (AND (AND (AND D C) B) A)
)

!(assertEqual
    (propagateNot (NOT (NOT (NOT (NOT (OR A (AND B (OR C D))))))))
    (OR (AND (OR D C) B) A)
)


!(assertEqual
    (propagateNot (NOT (AND (AND I (AND J (NOT (OR K (OR L M))))) (AND B (NOT (AND C (OR D (OR E (NOT (OR F (AND G H)))))))))))
    (OR (OR (AND (OR (OR (AND (OR (NOT H) (NOT G)) (NOT F)) E) D) C) (NOT B)) (OR (OR (OR (OR M L) K) (NOT J)) (NOT I)))
)

!(assertEqual
    (propagateNot (NOT (OR (OR I (OR J (AND K (AND L M)))) (OR B (OR C (AND D (AND E (AND F (AND G H)))))))))
    (AND (AND (AND (OR (OR (OR (OR (NOT H) (NOT G)) (NOT F)) (NOT E)) (NOT D)) (NOT C)) (NOT B)) (AND (AND (OR (OR (NOT M) (NOT L)) (NOT K)) (NOT J)) (NOT I)))
)

!(assertEqual
    (propagateNot (NOT (OR (OR (OR C D) B) A)))
    (AND (NOT A) (AND (NOT B) (AND (NOT D) (NOT C))))
)

!(assertEqual
    (propagateNot (OR (AND (AND C D) B) (NOT A)))
    (OR (NOT A) (AND B (AND D C)))
)
