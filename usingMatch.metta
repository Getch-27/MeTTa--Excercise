(= ($logic  $a $b) ($logic  (propagateNot $a) (propagateNot $b)))

(= (test $x)
    (match $self ($x) $x)
)
! (test (AND a v))
 ;! (test (NOT (AND (AND I (AND J (NOT (OR K (OR L M))))) (AND B (NOT (AND C (OR D (OR E (NOT (OR F (AND G H)))))))))))
 ;(OR (OR (NOT I) (OR (NOT J) (OR K (OR L M)))) (OR (NOT B) (AND C (OR D (OR E (AND (NOT F) (OR (NOT G) (NOT H))))))))