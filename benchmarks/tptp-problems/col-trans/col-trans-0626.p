include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , P, X] : ( (
 wd( A, P) &
 wd( P, C) &
  wd( X, C) &
   wd( B, X) &
    wd( A, C) &
     wd( A, B) &
      wd( C, B) &
       wd( P, B) &
        col( P, X, B) & col( B, X, C) & col( A, P, C) ) => col( A, B, C))) 
).
