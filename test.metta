;; taskes  
;; removeElement
(= (removeElement $x $y) (collapse (subtraction (superpose $y)  (superpose $x))))
;removeCommonLiterals
(= (removeCommonLiterals $list1 $list2)(collapse (removeElement $list1 (superpose $list2))))


!(removeElement (A B) (A C B H))


!(removeCommonLiterals (A B) ((A C B H) (A B D) (A C F B)))

(= (isMember $x $list)
    (if (== $list ()) False
        (not (== (intersection (superpose $x) (superpose $list)) ()))
    )
)
!(isMember (1) ())
!(isMember (1) (2 3 4 5)) 
!(isMember (3) (1 2 4 5)) 
!(assertEqualToResult (isMember (1) ()) (False))
!(assertEqualToResult (isMember (2) (2 3 4 5)) (True) )
