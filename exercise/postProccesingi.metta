(:length (-> (List $t) Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))

 ; Function to apply a function to each element in a list, and accumulate the results in a list, merge them with cons-atom
(: consMap (-> Atom $ac (List $t) (List $tt)))
(= (consMap $func $ac Nil) $ac)
(= (consMap $func $ac (Cons $x $xs))
    (let $result ($func $x)
        (consMap $func (cons-atom $result $ac) $xs)
    )
)

 ;; function that get the node value
(: getNodeValue (-> Tree Atom))
(= (getNodeValue (TreeNode (Value $value $truthValue $nodeType) $guardSet $children)) $value)

(: postProcessing (-> Tree List))
(= (postProcessing Nil) Nil)
(= (postProcessing (TreeNode (Value $value $truthValue $nodeType) $guardSet $children))
    (if (== $nodeType LITERAL)
        $value
        (if (== (length $guardSet) 1)
            (getNodeValue (head $guardSet))
            (if (== $nodeType AND)
                (let $result (consMap postProcessing () (extend $children $guardSet))
                    (cons-atom nAndArr $result)
                )
            (nOrArr (consMap postProcessing () $children))
        )
)
)
)

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
