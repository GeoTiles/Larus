include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, M , X, Y] : ( (
 wd( A, B) &
 wd( B, X) &
  wd( A, X) &
   wd( M, A) &
    wd( M, B) &
     wd( X, Y) &
      wd( M, X) &
       wd( M, Y) &
        col( Y, A, B) & col( M, X, Y) & col( M, A, B) ) => col( A, B, X))) 
).
