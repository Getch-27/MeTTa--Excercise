 ;output: ((Inheritance $X $Y $a) ...)
 ;(= (Inheritance (Nil $xs)))
(= (getValues ()) (empty))
(= (getValues ( Nil $xs)) (
         ; , (filter $xs)
    ))
(= (getValues ($x $xs)) (
        superpose ($x (getValues $xs))
    ))
(= (filter $val)
    (Inheritance (let $x (collapse (getValues $val)) $x))
)
(= (Inheritance ($x $xs))
    ($x $xs)
)

! (filter (Inheritance (y (x (a (Nil (Inheritance (y (x (b (Nil ())))))))))))
