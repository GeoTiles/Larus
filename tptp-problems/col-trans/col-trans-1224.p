include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, Aprime, Cprime] : ( (
 wd( O, Eprime) &
 wd( E, Eprime) &
  wd( O, Cprime) &
   wd( A, O) &
    wd( O, E) &
     col( O, Eprime, Aprime) &
      col( O, Eprime, O) &
       col( O, Eprime, Cprime) &
        col( E, O, Cprime) &
         col( O, E, A) & col( O, E, O) ) => col( O, E, Eprime)))  ).
