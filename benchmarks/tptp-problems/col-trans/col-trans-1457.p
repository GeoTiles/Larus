include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, Eprime, A, B] : ( (
 wd( O, E) &
 wd( A, O) &
  wd( A, B) &
   wd( O, B) &
    wd( E, Eprime) &
     wd( O, Eprime) &
      wd( A, A) &
       col( O, E, A) & col( O, E, B) & col( O, E, O) ) => col( O, A, B))) 
).

