include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, U, V, P, Z1, Z2] : ( (
 wd( U, V) &
 wd( P, B) &
  wd( Z1, P) &
   wd( Z1, Z2) &
    wd( A, B) &
     col( U, V, P) &
      col( U, V, Z1) &
       col( Z1, P, Z2) & col( A, P, B) ) => col( U, V, Z2)))  ).
