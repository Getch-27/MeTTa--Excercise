




 ;return Litral
(= (getLiteral ($value $x $bol $lit)) $lit)

 ;Return Value
(= (findValue (TreeNode ($value $x $bol $lit) $y $ys)) $x)

 ;Return Gurdset tree Values
(= (GuardsetValues Nil) ())

 ;for 1 and more than 1 guardset
(= (GuardsetValues (Cons $x $xs))
    (Cons (findValue $x)
        (GuardsetValues $xs)))

 ; check the length of the list
(:length (-> (List $t) Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))

 ;get childrens value
(= (getChildren Nil) Nil)
(= (getChildren (Cons $x $xs)) ( (postProcessing $x) (getChildren $xs) ))

(= (postProcessing (TreeNode $val $guard $child)) (
        if ( > (length $guard) 1)
        (n (getLiteral $val) (GuardsetValues $guard) (getChildren $child))
        (if ( == (length $guard) 0)
            (n (getLiteral $val) (getChildren $child) )
            (GuardsetValues $guard) )

    ))

 ;Test Case
! (postProcessing
    (TreeNode (Value Nil False AND)
        (Cons (TreeNode (Value A false LITERAL) Nil Nil)
            (Cons (TreeNode (Value B false LITERAL) Nil Nil)
                (Cons (TreeNode (Value C false LITERAL) Nil Nil) Nil)))

        (Cons (TreeNode (Value Nil False OR) Nil
                (Cons (TreeNode (Value A False AND) (Cons (TreeNode (Value A false LITERAL) Nil Nil) Nil) Nil)
                    (Cons (TreeNode (Value Nil False AND)
                            (Cons (TreeNode (Value A false LITERAL) Nil Nil)
                                (Cons (TreeNode (Value B false LITERAL) Nil Nil) Nil))
                            (Cons (TreeNode (Value Nil True OR) Nil
                                    (Cons (TreeNode (Value Nil False AND) (Cons (TreeNode (Value D false LITERAL) Nil Nil) Nil) Nil)
                                        (Cons (TreeNode (Value Nil True AND) (Cons (TreeNode (Value E false LITERAL) Nil Nil) Nil) Nil) Nil))) Nil))
                        (Cons (TreeNode (Value Nil True  AND) (Cons (TreeNode (Value B false LITERAL) Nil Nil) Nil) Nil) Nil)))) Nil)))

