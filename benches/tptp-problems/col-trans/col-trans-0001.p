include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D] : ( (
 wd( A, B) &
 wd( C, D) & col( A, B, C) & col( A, B, D) ) => col( A, D, C)))
 ).
