(: List type)
(: Nil List)
(: Cons (-> Number List List))

 ;; Length of list
(:length (-> List Number))
(= (length Nil) 0)
(= (length (Cons $x $xs))
    (+ 1 (length $xs))
)

 ;; check member
(:is_member (-> Number List Bool))
(= (is_member $num (Cons $x $xs))
    (
        if (== $num $x)
        True
        (
            if (== $xs Nil)
            False
            (is_member $num $xs)
        )
)
)
 ; append list to another list
(:Append (-> List List List))
(= (Append (Cons $x $xs) $list) (
        if (== $xs Nil)
        (Cons $x $list)
        (Cons $x (Append $xs $list))
    ))
 ;!(length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (is_member 5 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
! (Append (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))) (Cons 8 (Cons 9 Nil)))
