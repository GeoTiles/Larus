include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, P, M] : ( (
 wd( P, P) &
 wd( M, P) & wd( A, P) & wd( M, A) & col( M, A, P) ) => A = P ))).
