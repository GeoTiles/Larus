include('col-axioms.ax').

fof(pipo,conjecture,
(! [C, D, P, Q, Dprime, S, Y] : ( (
 wd( C, D) &
 wd( P, C) &
  wd( D, Dprime) &
   wd( C, Dprime) &
    wd( P, Q) &
     wd( P, D) &
      wd( C, Q) &
       wd( S, C) &
        wd( P, S) &
         col( C, Y, S) &
          col( D, C, Dprime) & col( C, S, D) ) => col( C, D, Y)))  ).
