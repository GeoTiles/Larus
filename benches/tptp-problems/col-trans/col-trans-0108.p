include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, P, Pprime, X, Xprime] : ( (
 wd( A, B) &
 wd( C, B) &
  wd( P, B) &
   wd( A, C) &
    wd( P, Pprime) &
     wd( B, Pprime) &
      wd( X, B) &
       col( B, Xprime, P) &
        col( A, Xprime, C) &
         col( A, X, C) &
          col( B, P, Pprime) & col( B, X, Pprime) ) => col( B, P, X)))  ).
