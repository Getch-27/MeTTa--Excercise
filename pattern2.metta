 ;output: ((Inheritance $X $Y $a) ...)
 ;(= (Inheritance (Nil $xs)))
(= (getValues ()) (empty))
(= (getValues ($x $xs))
    (superpose ( $x (getValues $xs)))
)
(= (filter ()) (empty))
(= (filter ($base $xs)) (
        let $x (collapse (getValues $xs)) ($base $x))
)

! (filter (Inherie (y (x (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
