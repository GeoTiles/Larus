include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , D, X] : ( (
 wd( D, A) &
 wd( A, B) &
  wd( D, B) &
   wd( C, A) &
    wd( C, B) &
     wd( A, X) &
      wd( B, X) &
       col( A, C, X) & col( B, D, X) & col( X, A, B) ) => col( C, A, B))) 
).
