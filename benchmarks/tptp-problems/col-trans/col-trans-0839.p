include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, X , Y, P, Q] : ( (
 wd( P, Q) &
 wd( X, Y) &
  wd( A, B) &
   wd( X, Y) &
    wd( A, B) &
     wd( X, Y) &
      wd( A, P) & col( A, B, P) & col( A, B, Q) ) => col( P, Q, A))) 
).

