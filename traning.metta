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
 ;Maximum value
(:max-value (->  List Number))
(= (max_value (Cons $x $xs)) ())
 ;push
(:push (-> Number List List))
(= (push $num (Cons $x $xs))
    (
        if (== $xs Nil)
        (Cons $x (Cons $num Nil))
        (Cons $x (push $num $xs))
    )
)
 ;pop
(:pop (-> List List))
(= (pop (Cons $x $xs))
    (
        if (== $xs Nil)
        Nil
        (Cons $x ( pop $xs))
    )
)
 ;remove element
(:Remove_element (-> Number List List))
(= (Remove_element $num (Cons $x $xs) )
    (
        if ( and (== $xs Nil) (not (== $num $x)))
        (Cons $x $xs )
        (
            if (== $num $x)
            $xs
            (Cons $x (Remove_element $num $xs))
        )

)
)

 ;map
(:map (-> opration Number list list))
(= (map $opp $num Nil) Nil)
(= (map $opp $num (Cons $x $xs))
    (Cons ($opp $num $x) (map $opp $num $xs ))
)

 ;filter
(:filter (-> (condition) List List))
(= (filter ($opp $element $num) (Cons $x $xs))
    (if ())
)

 ;!(length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (is_member 5 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (Append (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))) (Cons 8 (Cons 9 Nil)))
 ;! (max_value (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (push 8 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (pop (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (Remove_element 7 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (map * 8 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
! (filter == $x )
