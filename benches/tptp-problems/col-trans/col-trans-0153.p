include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, X, P, Q, Qprime] : ( (
 wd( P, Q) &
 wd( Q, X) &
  wd( P, X) &
   wd( Q, Qprime) &
    wd( X, Qprime) &
     wd( B, P) &
      wd( A, P) &
       wd( B, Q) &
        wd( A, Q) & col( P, Qprime, X) & col( Q, X, Qprime) ) => col( P, Q, X))) 
).
