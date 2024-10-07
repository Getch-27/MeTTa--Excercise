(=(AND $x) (cons-atom AND $x))
(=(OR $x) (cons-atom OR $x))

;; Propagate to childrens for both (propagateNot NOT) and (propagateNot logic)
(= (propagateChildrens $tuple) (collapse (propagateNot (superpose $tuple))))
;(= (propagateNotChildrens $tuple) (collapse (propagateNot NOT (superpose $tuple))))

(= (propagateNot $expr)
   (if (== (get-metatype $expr) Expression)
       (
          let* (
                 ($op (car-atom $expr))
                 ($tuple (cdr-atom $expr))
             )
             (case ($op $tuple)
               (
                 ((AND $tuple) (let $res (propagateChildrens $tuple) (AND $res)))
                 ((OR $tuple) (OR (let $res (propagateChildrens $tuple) (OR $res))))
                 
                 \\((NOT $tuple) $tuple)
                 ($expr $expr)
               )
             )
       )
       $expr
   )
)
!(propagateNot (AND (NOT (OR A B)) (NOT (AND C D E)) (OR A B) A B))
;!(propagateNot B) ;; normal propagate symbol
;!(propagateNot (AND A B)) ;; and NOde
;!(propagateNot (OR A B)) ;; Or node