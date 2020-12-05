include('col-axioms.ax').

fof(pipo,conjecture,
(! [P, Q, A, B, C, D, T, X, Y] : ( (
 wd( P, Q) &
 wd( A, D) &
  wd( B, D) &
   wd( D, P) &
    wd( D, Q) &
     wd( B, P) &
      wd( B, Q) &
       wd( C, P) &
        wd( C, Q) &
         wd( A, P) &
          wd( A, Q) &
           col( T, P, Q) &
            col( X, P, Q) &
             col( Y, P, Q) &
              col( A, B, D) &
               col( Y, Y, A) &
                col( X, Y, B) &
                 col( B, Y, D) &
                  col( A, X, D) & col( A, T, C) ) => col( A, D, Y))) 
).
