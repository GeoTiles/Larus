include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, F, P, X, Q, DD, FF] : ( (
 wd( A, B) &
 wd( X, F) &
  wd( D, X) &
   wd( B, Q) &
    wd( X, P) &
     wd( B, C) &
      wd( A, C) &
       wd( D, F) &
        wd( X, FF) &
         wd( DD, FF) &
          wd( X, DD) &
           col( DD, X, FF) &
            col( X, F, FF) & col( X, D, DD) ) => col( D, X, F))) 
).
