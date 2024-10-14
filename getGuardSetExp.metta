; a function to get the guardset of an n-ary expression as a tuple. 
(= (getGuardSetExp $expOriginal $expRecursive $acc)
    (if (== (get-metatype $expOriginal) Symbol) ($expOriginal) ;if $exp is LITERAL, the guardSet is the set containing the literal itself
    (if (== $expRecursive ()) $acc
        (let*
            (
                ($head (car-atom $expRecursive))
                ($headIsExpression (== (get-metatype $head) Expression))
                ($tail (cdr-atom $expRecursive))
                ($tailIsExpression (== (get-metatype $tail) Expression))
            )
            (if (== $head NOT) 
             (case $expOriginal
                 (
                     ((NOT $b) (if (== (get-metatype $b) Symbol) $expOriginal ())) ;If the head of the expression is NOT, $b should only be a literal for it to have a guardSet of (NOT $b). If $b is an expression, the guardSet is ()
                 )
             )
             (if (== $head OR) ()  ;an OR expression doesn't have a guardSet
                 (if (== $head AND) ; an AND expression has a guardSet which contains its literal and (NOT $literal) children
                     (getGuardSetExp $expOriginal $tail $acc)
                     (if $headIsExpression
                         (case $head
                             (
                                 ( (NOT $a) (getGuardSetExp $expOriginal $tail (cons-atom $head $acc)))
                                 ($else (getGuardSetExp $expOriginal $tail $acc))
                             )
                         )
                         (getGuardSetExp $expOriginal $tail (cons-atom $head $acc))
                     )
                 )
             )
            )
        )
    ) 
    )
)

;; Test 01 - getGuardSet of an empty set
! (assertEqualToResult (getGuardSetExp () () ()) (()))

;; Test 02 - getGuardSet of a literal
! (assertEqualToResult (getGuardSetExp A A ()) ((A)))
! (assertEqualToResult (getGuardSetExp (A) (A) ()) ((A)))

;; Test 02 - getGuardSet of OR and NOT expressions
! (assertEqualToResult (getGuardSetExp (OR) (OR) ()) (()))
! (assertEqualToResult (getGuardSetExp (OR A B (NOT A)) (OR A B (NOT A)) ()) (()))
! (assertEqualToResult (getGuardSetExp (OR (AND A B) (AND A B) (NOT A)) (OR (AND A B) (AND A B) (NOT A)) ()) (()))

;; Test 03 - getGuardSet of AND expressions
! (assertEqualToResult (getGuardSetExp (AND) (AND) ()) (()))
! (assertEqualToResult (getGuardSetExp (AND A) (AND A) ()) ((A)))
! (assertEqualToResult (getGuardSetExp (AND (NOT A) (NOT B) A) (AND (NOT A) (NOT B) A) ()) ((A (NOT B) (NOT A))))
! (assertEqualToResult (getGuardSetExp (AND A (AND A B) (OR A B) (NOT B)) (AND A (AND A B) (OR A B) (NOT B)) ()) (((NOT B) A)))
! (assertEqualToResult (getGuardSetExp (AND (AND A B) A) (AND (AND A B) A) ()) ((A)))
! (assertEqualToResult (getGuardSetExp (AND A B (NOT B)) (AND A B (NOT B)) ()) (((NOT B) B A)))
! (assertEqualToResult (getGuardSetExp (AND A (NOT A) (NOT B)) (AND A (NOT A) (NOT B)) ()) (((NOT B) (NOT A) A)))
! (assertEqualToResult (getGuardSetExp (AND (NOT A) A B) (AND (NOT A) A B) ()) ((B A (NOT A))))
!(getGuardSetExp (NOT A) (NOT A) ())