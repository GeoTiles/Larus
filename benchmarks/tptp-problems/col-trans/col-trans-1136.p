include('col-axioms.ax').

fof(pipo,conjecture,
(! [G, A, Z , F, E, R] : ( (
 wd( G, A) &
 wd( A, Z) &
  wd( G, Z) &
   wd( E, G) &
    wd( E, Z) &
     wd( F, A) &
      wd( F, Z) &
       wd( R, G) &
        wd( R, A) &
         wd( E, F) &
          wd( E, R) &
           col( R, G, A) &
            col( E, G, Z) &
             col( F, A, Z) & col( A, R, F) ) => col( G, A, Z))) 
).

