
(= (extruct ($x ($xs $xss))) (
        if (== $xs Nil)
        ($x (add-atom &self (= (foo) $xss)))
        ($x (extruct ($xs $xss)))
    ))

(= (parse_expression $x) (
        (extruct $x)
        (match &self (= (foo) $next)
            (let () (remove-atom &self (= (foo) $next))
                (extruct $next))

        )
))

! (parse_expression  (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))