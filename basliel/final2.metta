 ; put you code here

(= (handle $x ()) $x)
(= (handle $val ($x $y))
    (let $z (cons-atom $x $val) (handle $z $y) )
)

(= (get_elements  () ()) ())
( = (get_elements $val ($x ($xs $xss)))
    (
        if ( == $xs Nil)
        ( (cons-atom $x $val) (get_elements () $xss))
        (let $f (cons-atom $x $val ) (get_elements $f  ($xs $xss)) )
    )

)

(= (parse_expression ($x ($xs $xss)))
    (handle () (get_elements  () ($x ($xs $xss))))

)

! (parse_expression  (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
