include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C , M] : ( (
 wd( A, B) &
 wd( M, A) &
  wd( M, B) &
   wd( M, C) & col( A, B, C) & col( M, A, B) ) => col( A, M, C)))  ).
