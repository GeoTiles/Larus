include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Bprime, Cprime] : ( (
 wd( A, B) &
 wd( B, C) &
  wd( A, C) &
   wd( Cprime, A) &
    wd( Bprime, A) &
     col( A, Bprime, Cprime) &
      col( A, C, Cprime) & col( A, B, Bprime) ) => col( A, B, C)))  ).
