include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B, C, Aprime, Bprime] : ( (
 wd( O, Eprime) &
 wd( A, O) &
  wd( B, O) &
   wd( C, O) &
    wd( Aprime, O) &
     wd( Bprime, O) &
      wd( O, E) &
       wd( E, Eprime) &
        wd( A, Aprime) &
         col( O, E, A) &
          col( O, E, B) &
           col( O, E, C) &
            col( O, Eprime, Aprime) &
             col( O, Eprime, Bprime) & col( O, Eprime, C) ) => col( O, E, Eprime))) 
).

