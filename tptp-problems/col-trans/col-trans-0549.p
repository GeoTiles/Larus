include('col-axioms.ax').

fof(pipo,conjecture,
(! [D, A, B0, C0] : ( (
 wd( A, C0) &
 wd( D, A) &
  wd( A, B0) &
   wd( D, B0) &
    wd( B0, C0) & col( A, D, C0) & col( A, B0, C0) ) => col( D, A, B0))) 
).
