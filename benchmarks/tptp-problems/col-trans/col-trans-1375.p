include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B, C, D, U] : ( (
 wd( U, O) &
 wd( O, E) &
  wd( O, Eprime) &
   wd( E, Eprime) &
    wd( A, O) &
     wd( B, O) &
      wd( C, O) &
       wd( D, O) &
        wd( O, Eprime) &
         wd( U, Eprime) &
          col( O, E, A) &
           col( O, E, B) &
            col( O, E, C) &
             col( O, E, D) &
              col( O, E, U) & col( O, Eprime, B) ) => col( O, E, Eprime))) 
).
