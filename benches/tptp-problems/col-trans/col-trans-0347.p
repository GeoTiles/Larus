include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, Bprime, C] : ( (
 wd( A, B) &
 wd( A, Bprime) &
  wd( B, C) &
   wd( A, C) & col( B, A, Bprime) & col( A, Bprime, C) ) => col( A, B, C)))  ).
