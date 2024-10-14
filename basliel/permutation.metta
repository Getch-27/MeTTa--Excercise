(= (permutaion $expr) (
    let * (
            ($first (car-atom $expr))
            ($sec (cdr-atom $expr))
            
          )
          $first
))


!(permutaion (A B))