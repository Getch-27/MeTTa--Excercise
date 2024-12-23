! (bind! np-arange (py-atom numpy.arange)) ; ()
;! (np-arange 4) ; array([0, 1, 2, 3])
;! (np-arange (Kwargs (step 2) (stop 8))) ; array([0, 2, 4, 6])
;! (np-arange (Kwargs (start 2) (stop 10) (step 3))) ; array([2, 5, 8])

!(match np-arange (py-atom $x) $x)