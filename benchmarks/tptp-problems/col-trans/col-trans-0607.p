include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, Aprime, P, P1, P2, Bprime] : ( (
 wd( P1, P2) &
 wd( A, B) &
  wd( Aprime, P) &
   wd( Aprime, Bprime) &
    col( Aprime, P1, P2) &
     col( P, P1, P2) & col( Aprime, Bprime, P) ) => col( Bprime, P1, P2)))  ).
