include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , P, T] : ( (
 wd( A, C) &
 wd( B, P) &
  wd( A, B) &
   wd( C, B) &
    wd( B, T) &
     wd( A, T) &
      wd( C, T) &
       col( A, C, T) & col( B, P, T) & col( A, B, P) ) => col( T, A, B))) 
).
