(: gatherJunctors (-> Tree Tree Tree))
(= (gatherJunctors $currentNode $centerNode)
    (let* (
            ($currentNodeType (getNodeType $currentNode))
            ($centerNodeType (getNodeType $centerNode))
            ($currentLeft (getChild $currentNode L))
            ($currentRight (getChild $currentNode R))
            ( (TreeNode (Value $valueName $constraint $currentNodeType) $guardSet $children) $currentNode)
        )
    (if (and (== $currentNodeType ROOT) (not (== $currentRight NilNode)))
        (let*
            (
                ($updatedCurrent (changeType $currentNode AND))
                ($removedChildCurrent (replaceChildren $updatedCurrent Nil))
                ($finalUpdatedCurrent (gatherJunctors $currentRight $removedChildCurrent))
            )
        $finalUpdatedCurrent
    )
(if (or (== $currentNodeType AND) (== $currentNodeType OR))
    (if  (== $currentNodeType $centerNodeType)
        (let*
            (
                ($leftUpdatedCenter (gatherJunctors $currentLeft $centerNode))
                ($rightUpdatedCenter (gatherJunctors $currentRight $leftUpdatedCenter))
            )
        $rightUpdatedCenter
    )
(let*
    (
        ($removedChildCurrent (replaceChildren $currentNode Nil))
        ($leftUpdatedCenter (gatherJunctors $currentLeft $removedChildCurrent))
        ($rightUpdatedCenter (gatherJunctors $currentRight $leftUpdatedCenter))
        ($updatedChildrenCenter (prependChild $centerNode $rightUpdatedCenter))
    )
$updatedChildrenCenter
)
)
(if (== $currentNodeType LITERAL)
    (if (== $centerNodeType AND)
        (prependToGuardSet $centerNode $currentNode)
        (prependChild $centerNode (TreeNode (Value Nil $constraint AND) (Cons $currentNode Nil) $children))
    )
NilNode
)
)
)
)
)

! (gatherJunctor (OR A B) NONE) ( (OR A B))
 ;; ;; Test 02

 ;input expression: (OR A (OR B (OR C D)))
 ;! (assertEqual (gatherJunctor (OR A (OR B (OR C D))) NONE) ( (OR A B C D)))
 ;output expression: (OR A B C D)

 ;; ;; Test 03

 ;; ;; input expression: (OR (OR (OR C D) B) A)
 ;; !(assertEqual (gatherJunctor (OR (OR (OR C D) B) A) NONE) ((OR C D B A)))
 ;; ;; output expression: (OR C D B A) | (OR A B C D). The order doesn't matter.

 ;; ;; Test 04

 ;; ;; input expression: (OR (OR B (OR C D)) A)
 ;; !(assertEqual (gatherJunctor (OR (OR B (OR C D)) A) NONE) ((OR B C D A)))
 ;; ;; output expression: (OR B C D A) | (OR A B C D). The order doesn't matter.

 ;; ;; Test 05

 ;; ;; input expression: (AND A (AND B (AND C D)))
 ;; !(assertEqual (gatherJunctor (AND A (AND B (AND C D))) NONE) ((AND A B C D)))
 ;; ;; output expression: (AND A B C D)
