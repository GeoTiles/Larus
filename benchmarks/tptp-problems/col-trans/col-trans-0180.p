include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Cprime] : ( (
 wd( B, A) &
 wd( B, Cprime) &
  wd( A, Cprime) &
   wd( B, C) & col( A, B, C) & col( A, B, Cprime) ) => col( B, Cprime, C)))  ).

