include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Aprime, P, Q, X, Y] : ( (
 wd( B, A) &
 wd( C, A) &
  wd( P, Q) &
   wd( X, Y) &
    wd( P, Q) &
     wd( X, Y) &
      wd( A, Aprime) &
       wd( C, Aprime) &
        col( P, Q, Aprime) &
         col( P, Q, Aprime) &
          col( A, B, C) &
           col( A, C, Aprime) & col( Aprime, C, Aprime) ) => col( A, Aprime, B))) 
).

