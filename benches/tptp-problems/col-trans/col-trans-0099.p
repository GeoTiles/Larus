include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, E, F, P, Q, DD, FF, X, CC] : ( (
 wd( A, B) &
 wd( D, E) &
  wd( E, F) &
   wd( B, Q) &
    wd( E, P) &
     wd( B, C) &
      wd( A, C) &
       wd( D, F) &
        wd( D, P) &
         wd( E, FF) &
          wd( E, DD) &
           wd( CC, B) &
            wd( E, X) &
             col( E, DD, P) &
              col( DD, X, FF) &
               col( B, C, CC) &
                col( E, X, P) &
                 col( E, F, FF) & col( E, D, DD) ) => col( D, E, P))) 
).
