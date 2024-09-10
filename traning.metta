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
(:max_value (->  List Number))
(= (find_max $num Nil) ($num Nil))
(= (max_value ($num Nil)) $num)

(= (find_max $max (Cons $x $xs))
    (if (> $max $x)
        (Cons $max $xs)
        (Cons $x $xs)
    )
)
(= (max_value (Cons $x $xs)) (max_value (find_max $x $xs)))

 ;minimum_value
(:min_value (->  List Number))
(= (find_min $num Nil) ($num Nil))
(= (min_value ($num Nil)) $num)

(= (find_min $max (Cons $x $xs))
    (if (< $max $x)
        (Cons $max $xs)
        (Cons $x $xs)
    )
)
(= (min_value (Cons $x $xs)) (min_value (find_min $x $xs)))

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
(= (Remove_element $num Nil) Nil)
(= (Remove_element $num (Cons $x $xs) )
    (
        if ( and (== $xs Nil) (not (== $num $x)))
        (Cons $x $xs )
        (
            if (== $num $x)
            (Remove_element $num $xs)
            (Cons $x (Remove_element $num $xs))
        )

)
)

 ;remove duplicate
(:remove_duplicate (-> List List))
(= (remove_duplicate Nil) Nil)
(= (remove_duplicate (Cons $x $xs))
    (if (is_member $x $xs)
        (let $removed (Remove_element $x $xs) (Cons $x (remove_duplicate $removed)))
        (let $removed (remove_duplicate $xs) (Cons $x $removed)))
)
 ;sort
(= (sort Nil) Nil)
(= (insert $num Nil) (Cons $num Nil))

(= (sort (Cons $x $xs))
    (insert  $x (sort $xs)))
(= (insert  $num (Cons $x $xs))
    (if (> $num $x)
        (Cons $x (insert  $num $xs))
        (Cons $num (Cons $x $xs))))

 ;map
(:map (-> opration Number list list))
(= (map $opp $num Nil) Nil)
(= (map $opp $num (Cons $x $xs))
    (Cons ($opp $num $x) (map $opp $num $xs ))
)

 ;filter
(:filter (-> Number List List))
(= (filter $x Nil) Nil)
(= (filter  $num (Cons $x $xs))
    (
        if (== $num $x)
        (Cons $x (filter $num $xs))
        (filter $num $xs)
    )
)

 ;reverse
(:reverse (-> List List))
(= (reverse Nil) Nil)
(= (append Nil $num) (Cons $num Nil))

(= (append (Cons $x $xs) $num)
    (Cons $x (append $xs $num)))
(= (reverse (Cons $x $xs))
    (append (reverse $xs) $x))

 ;! (length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (is_member 5 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (Append (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))) (Cons 8 (Cons 9 Nil)))
 ;! (max_value (Cons 100 (Cons 2 (Cons 9 (Cons 900 (Cons 5 (Cons 10 (Cons 700 Nil))))))))
 ;! (min_value (Cons 100 (Cons 2 (Cons 9 (Cons 900 (Cons 5 (Cons 10 (Cons 700 Nil))))))))
 ;! (push 8 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (pop (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (Remove_element 7 (Cons 7 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 7 (Cons 7 Nil))))))))
 ;! (remove_duplicate (Cons 2 (Cons 2 (Cons 3 (Cons 2 (Cons 5 (Cons 5 (Cons 3 Nil))))))))
 ;! (sort (Cons 6 (Cons 13 (Cons 3 (Cons 4 (Cons 8 (Cons 6 (Cons 7 Nil))))))))
 ;! (map * 8 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (filter 2 (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
 ;! (reverse (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 Nil))))))))
