include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , D] : ( (
 wd( B, A) &
 wd( D, A) &
  wd( A, C) &
   wd( C, D) &
    wd( B, C) &
     wd( B, D) &
      col( A, B, C) & col( D, A, C) & col( A, B, D) ) => col( D, B, C))) 
).
