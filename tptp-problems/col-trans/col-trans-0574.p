include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, E, F, A0] : ( (
 wd( D, E) &
 wd( F, E) &
  wd( A, B) &
   wd( B, C) &
    wd( A, C) &
     wd( A, A0) &
      wd( D, F) &
       wd( B, A0) &
        col( A0, B, C) &
         col( A, B, A0) & col( D, E, F) ) => col( A, B, C)))  ).
