include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, T, P0, X, Y] : ( (
 wd( A, B) &
 wd( C, B) &
  wd( T, B) &
   wd( A, C) &
    wd( P0, B) &
     wd( P0, A) &
      wd( Y, B) &
       wd( X, B) &
        wd( X, Y) &
         wd( T, X) &
          wd( T, Y) &
           wd( A, Y) &
            col( X, T, Y) &
             col( B, C, T) &
              col( B, C, X) &
               col( B, C, Y) & col( B, A, X) ) => col( A, B, C))) 
).
