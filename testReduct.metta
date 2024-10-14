(= (buildTree $expr) 
  (case $expr
    (
      ( (AND $a $b) (TreeNode (Value Nil False AND) Nil (Cons (buildTree $a) (Cons (buildTree $b) Nil))) )
      ( (OR $a $b) (TreeNode (Value Nil False OR) Nil (Cons (buildTree $a) (Cons (buildTree $b) Nil))))
      ( (NOT $x) (TreeNode (Value Nil False NOT) Nil (Cons NilNode (Cons (buildTree $x) Nil))))
      ( $symbol (TreeNode (Value $symbol False LITERAL) Nil Nil))
    )
  )
)

(= (buildTreeWithRoot $expr)
  (TreeNode (Value Nil False ROOT) Nil (Cons NilNode (Cons (buildTree $expr) Nil)))
)

!(buildTreeWithRoot (NOT (NOT A)))