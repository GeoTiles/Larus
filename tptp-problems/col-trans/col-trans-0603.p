include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, P] : ( (
 wd( A, P) &
 wd( P, C) &
  wd( A, C) &
   wd( B, A) &
    wd( A, C) & wd( B, C) & colH(A, P, C) & colH(B, A, C) ) => colH(B, C, P)))
).
