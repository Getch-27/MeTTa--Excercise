;a function to return list of fibonancii of a number
(= (fibonacci $n $a $b $count)  
   (if (<= $count $n)  
        ( $a (fibonacci $n $b (+ $a $b) (+ $count 1)))  
       ( )))
(=(find_fib $x)(fibonacci $x 0 1 1))  
  
! (find_fib 10)
