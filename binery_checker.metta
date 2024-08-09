; check the length of the list
(:length (-> (List $t) Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs)))

; Define the function to check if each subtree is also binary
(= (check-binary (TreeNode $value Nil $children))(
    if (<= ( length $children) 2)
        True
        False
)) 
!(check-binary (TreeNode (Value Nil False ROOT) Nil (Cons (TreeNode (Value Nil True OR) Nil (Cons (TreeNode (Value a False LITERAL) Nil Nil) (Cons (TreeNode (Value Nil True AND) Nil (Cons (TreeNode (Value b False LITERAL) Nil Nil) (Cons (TreeNode (Value c False LITERAL) Nil Nil) Nil))) Nil))) Nil)))
