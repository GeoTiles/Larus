include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, P, A , B, M] : ( (
 wd( O, P) &
 wd( O, A) &
  wd( A, B) &
   wd( O, B) &
    wd( M, A) &
     wd( M, B) & col( A, O, M) & col( A, M, B) ) => col( O, A, B))) 
).
