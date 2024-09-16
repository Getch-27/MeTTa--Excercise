 ;reverse
(:reverse (-> List List))

(= (reverse ()) ())
(= (append () $num) ( $num ()))

(= (append ( $x $xs) $num)
    ( $x (append $xs $num)))
(= (reverse ( $x $xs))
    (append (reverse $xs) $x))

! (reverse (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
