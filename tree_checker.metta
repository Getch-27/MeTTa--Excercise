;binary tree
!(TreeNode (Value Nil False ROOT) Nil (Cons NilNode (Cons (TreeNode (Value Nil True OR) Nil (Cons (TreeNode (Value a False LITERAL) Nil Nil) (Cons (TreeNode (Value 
Nil True AND) Nil (Cons (TreeNode (Value b False LITERAL) Nil Nil) (Cons (TreeNode (Value c False LITERAL) Nil Nil) Nil))) Nil))) Nil)))

;constrient tree
;!(TreeNode (Value Nil False OR) Nil 
 ;   (Cons (TreeNode (Value A False LITERAL) Nil Nil) (Cons (TreeNode (Value B True LITERAL) Nil Nil) (Cons (TreeNode (Value C False LITERAL) Nil Nil) (Cons (TreeNode (Value D False LITERAL) Nil Nil) (Cons (TreeNode (Value E True LITERAL) Nil Nil) Nil))))))

!((TreeNode (Value Nil False ROOT) Nil (Cons NilNode (Cons (TreeNode (Value Nil False NOT) Nil (Cons NilNode (Cons (TreeNode (Value Nil False NOT) Nil (Cons NilNode (Cons (TreeNode (Value A False LITERAL) Nil Nil) Nil))) Nil))) Nil))))