include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Aprime] : ( (
 wd( B, Aprime) &
 wd( B, C) &
  wd( A, Aprime) &
   wd( Aprime, C) &
    wd( B, A) & col( A, B, C) & col( Aprime, B, C) ) => col( B, Aprime, A)))
).
