include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Pprime, X, Y] : ( (
 wd( A, C) &
 wd( A, B) &
  wd( X, Y) & col( A, B, C) & col( A, B, Pprime) ) => col( A, C, Pprime)))  ).
