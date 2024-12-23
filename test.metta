;; taskes  
;; removeElement
(= (removeElement $x $y) (
    collapse (subtraction (superpose $y)  (superpose $x))
   ))

!(assertEqualToResult 
  (removeElement (A B) (A C B H))
  ((C H))
 )
 !(assertEqualToResult 
  (removeElement (A) (A C B H))
  ((C B H))
 )
  !(assertEqualToResult 
  (removeElement () (A C B H))
  ((A C B H))
 )
  !(assertEqualToResult 
  (removeElement (A B) (C  H))
  ((C H))
 )

!(assertEqualToResult 
  (removeElement (A B) ())
  (())
 )


;removeCommonLiterals
(= (removeCommonLiterals $common $tuple)
   ( if (== $tuple ())
        ()
        (collapse (removeElement $common (superpose $tuple)))
   )
)
!(assertEqualToResult
   (removeCommonLiterals (A B) ((A C B H) (A B D) (A C F B)))
   (((C H) (D) (C F)))
 )
 !(assertEqualToResult
  (removeCommonLiterals (A) ((A C B H) (A B D) (A C F B)))
  (((C B H) (B D) (C F B)))
 )
 !(assertEqualToResult
   (removeCommonLiterals () ((A C B H) (A B D) (A C F B)))
   (((A C B H) (A B D) (A C F B)))
 )
 !(assertEqualToResult
 (removeCommonLiterals (A B) ((C H) ( B D) (A C F B)))
 (((C H) (D) (C F )))
 )
 !(assertEqualToResult
  (removeCommonLiterals (A B) ())
  (())
 )



