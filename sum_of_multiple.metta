;a program to print the sum of even multiple of 3 and 5
(= (module $x) (or (== (% $x 3) 0) (== (% $x 5) 0)))
; Define the mult function with base case and recursive case
(= (mult $x) 
  (if (> $x 0)
       (if (module $x) 
          (+ $x (mult (- $x 1)))
           (mult (- $x 1)))
       0))
(= (multiplay $x) (mult (- $x 1)))
; Test the function
! (multiplay 10)
