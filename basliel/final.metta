
(= (extruct ($x (Nil ()))) ())
(= (extruct ($x ($xs $xss))) (
        if (== $xs Nil)
        ($x (add-atom &self (foo $xss)))
        ($x (extruct ($xs $xss)))
    ))
(= (parse_expression ()) ())
(= (parse_expression $x) (
        (extruct $x)
        (match &self (foo $next)
            (let () (remove-atom &self (foo $next))
                (parse_expression $next))

        )
))

! (parse_expression  (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
