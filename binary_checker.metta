; check the length of the list
(:length (-> (List $t) Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))


(=(check-binary Nil) True)

; Define the function to check if each subtree is also binary
(= (check-binary (Cons $x $y))(
    and (check-binary $x) (check-binary $y)
)) 

(= (check-binary (TreeNode $value Nil $children))(
    if (<= ( length $children) 2)
        (check-binary $children)
        False
))
;binary tree test
 
!(check-binary (TreeNode (Value Nil False ROOT) Nil (Cons (TreeNode (Value Nil True OR) Nil (Cons (TreeNode (Value a False LITERAL) Nil Nil) (Cons (TreeNode (Value Nil True AND) Nil (Cons (TreeNode (Value b False LITERAL) Nil Nil) (Cons (TreeNode (Value c False LITERAL) Nil Nil) Nil))) Nil))) Nil)))

;constrient tree
!(check-binary (TreeNode (Value Nil False OR) Nil
    (Cons (TreeNode (Value A False LITERAL) Nil Nil) (Cons (TreeNode (Value B True LITERAL) Nil Nil) (Cons (TreeNode (Value C False LITERAL) Nil Nil) (Cons (TreeNode (Value D False LITERAL) Nil Nil) (Cons (TreeNode (Value E True LITERAL) Nil Nil) Nil)))))))

