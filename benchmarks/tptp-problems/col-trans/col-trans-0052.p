include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, X , Y] : ( (
 wd( X, Y) &
 wd( Y, A) &
  wd( A, B) &
   wd( Y, B) &
    wd( X, A) &
     wd( X, B) & col( B, X, Y) & col( X, A, Y) ) => col( X, A, B))) 
).
