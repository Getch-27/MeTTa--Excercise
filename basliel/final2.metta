 ;reverse the list
(:reverse (-> List List))

(= (reverse ()) ())
(= (append () $ele) ( $ele ()))

(= (append ( $x $xs) $ele)
    ( $x (append $xs $ele)))
(= (reverse ( $x $xs))
    (append (reverse $xs) $x))

 ;! (reverse (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))

 ; put you code here
(= (handle $x ($xs)) (cons-atom $xs $x))
(= (handle $val ($x $y))
    (let $z (cons-atom $x $val) (handle $z $y) )
)

(= (get_elements  () ()) ())
(= (get_elements $val ($elm ()))  ( (cons-atom $elm $val)))
( = (get_elements $val ($x ($xs $xss)))
    (
        if (== $x Nil)
        (get_elements () ($xs $xss))
        (
            if ( == $xs Nil)
            ( (cons-atom $x $val) (get_elements () $xss))
            (let $f (cons-atom $x $val ) (get_elements $f  ($xs $xss)) )
        )
))

(= (parse_expression ($x ($xs $xss)))
    (handle () (get_elements  () (reverse ($x ($xs $xss)))))

)

! (parse_expression  (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
