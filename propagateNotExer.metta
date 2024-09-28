(: propagateNot (-> Expression Expression))
(= (propagateNot ($logic  $a $b)) ($logic  (propagateNot $a) (propagateNot $b)))
(= (propagateNot (NOT (AND $b $c))) (OR (propagateNot (NOT $b)) (propagateNot (NOT $c))))
(= (propagateNot (NOT (OR $b $c))) (AND (propagateNot (NOT $b)) (propagateNot (NOT $c))))
(= (propagateNot (NOT (NOT $x))) (propagateNot $x))

! (test (NOT (AND (AND I (AND J (NOT (OR K (OR L M))))) (AND B (NOT (AND C (OR D (OR E (NOT (OR F (AND G H)))))))))))
(OR (OR (NOT I) (OR (NOT J) (OR K (OR L M)))) (OR (NOT B) (AND C (OR D (OR E (AND (NOT F) (OR (NOT G) (NOT H))))))))
! (propagateNot )