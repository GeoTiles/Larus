include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , P, Q] : ( (
 wd( A, B) &
 wd( C, B) &
  wd( P, B) &
   wd( Q, B) &
    wd( A, C) & col( B, P, Q) & col( B, A, P) ) => col( B, A, Q)))  ).
