include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B, C, D] : ( (
 wd( C, O) &
 wd( A, O) &
  wd( B, O) &
   wd( D, O) &
    wd( O, E) &
     wd( O, Eprime) &
      wd( E, Eprime) &
       wd( O, Eprime) &
        wd( Eprime, C) &
         col( O, E, A) &
          col( O, E, B) &
           col( O, E, C) &
            col( O, E, D) & col( O, Eprime, B) ) => col( O, E, Eprime))) 
).
