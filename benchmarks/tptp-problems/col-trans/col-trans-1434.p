include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B, C, Bprime] : ( (
 wd( O, E) &
 wd( A, Eprime) &
  wd( E, Eprime) &
   wd( O, Eprime) &
    wd( Bprime, Eprime) &
     col( O, E, A) &
      col( O, E, B) &
       col( O, E, C) &
        col( O, A, Eprime) &
         col( E, A, Eprime) & col( Bprime, O, Eprime) ) => col( O, E, Eprime)))  ).

