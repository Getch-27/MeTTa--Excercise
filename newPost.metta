 ;return Litral
(:getLiteral (-> (Value A Bool LITERAL) LITERAL))
(= (getLiteral ($value $x $bol $lit)) $lit)

 ;get childrens value
(:getChildren (-> List expression))
(= (getChildren Nil) Nil)
(= (getChildren (Cons $x $xs)) ( (postProcessing $x) (getChildren $xs) ))

 ; put you code here
(= (findValue (TreeNode ($value $x $bol $lit) $y $ys) )$x)
 ;Return Gurdset tree Values
(= (GuardsetValues Nil) (empty))
(= (GuardsetValues (Cons $x $xs)) (
        superpose (
            (findValue $x)
            (GuardsetValues $xs))))

 ; check the length of the list
(:length (-> (List $t) Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))

(= (postProcessing (TreeNode $val $guard $child)) (
        if (> (length $guard) 1)
        (let $x (collapse (GuardsetValues $guard))
            (n (getLiteral $val) $x (let $b (getChildren $child)   (car-atom $b))))
        (if ( == (length $guard) 0)
            (n (getLiteral $val) (getChildren $child))
            (GuardsetValues $guard))
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