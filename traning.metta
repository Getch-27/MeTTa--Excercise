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
(:Append (-> List List List))

 ;!(length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (is_member 5 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
! (Append 5 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
