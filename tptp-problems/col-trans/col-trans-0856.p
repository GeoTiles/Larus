include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, X, Y, C, I] : ( (
 wd( X, Y) &
 wd( A, B) &
  wd( A, C) & wd( B, C) & colH(A, C, B) & colH(A, I, C) ) => colH(A,  I,  B)))
).
