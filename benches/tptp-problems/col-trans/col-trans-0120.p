include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , D] : ( (
 wd( A, D) &
 wd( D, B) &
  wd( B, A) &
   wd( B, C) &
    wd( A, C) & col( D, A, C) & col( A, D, B) ) => col( A, B, C)))  ).
