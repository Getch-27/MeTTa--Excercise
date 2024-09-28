; (: propagateNot (-> $expr $expr))

(= (propagateNot AND $tuple) 
  $tuple
)
(= (propagateNot NOT ($tuple)) $tuple)

(= (propagateNot $expr)
    (let* (
                ($op (car-atom $expr)) 
                ($tuple (cdr-atom $expr))
            )
         (propagateNot $op $tuple)
    )
)

;; Example usage with n-ary expressions:
! (propagateNot (NOT (AND (NOT (OR (AND G F E) D C)) B A)))
! (propagateNot (AND (NOT (OR (AND G F E) D C)) B A))
