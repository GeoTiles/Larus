include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B, C, D, X] : ( (
 wd( C, O) &
 wd( O, E) &
  wd( O, Eprime) &
   wd( E, Eprime) &
    wd( A, O) &
     wd( B, O) &
      wd( D, O) &
       wd( Eprime, A) &
        wd( X, O) &
         wd( B, X) &
          col( O, E, A) &
           col( O, E, B) &
            col( O, E, C) &
             col( O, E, D) &
              col( O, Eprime, X) & col( O, E, X) ) => col( O, E, Eprime))) 
).
