include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , Q, X] : ( (
 wd( B, C) &
 wd( A, B) &
  wd( C, Q) &
   wd( B, Q) &
    wd( Q, A) &
     wd( A, C) &
      col( Q, X, A) & col( B, C, Q) & col( A, B, C) ) => col( A, Q, B))) 
).
