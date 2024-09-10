(= (traverse ()) empty)
(= (traverse ($ele ($x $xs)))
    (
        if (== $x Nil)
        (superpose ($ele (parse_expression $xs)))
        (superpose ($ele  (traverse ($x $xs))))
    )
)
(= (parse_expression ()) (empty))
(= (parse_expression $exp)
    (let $element (collapse (traverse $exp))  $element)
)

! (parse_expression  (Inherie (y (b (a (Nil (Inherie (y (x (a (Nil (Inheritance (y (x (b (d (Nil ())))))))))))))))))
