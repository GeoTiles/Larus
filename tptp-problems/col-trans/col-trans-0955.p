include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, X, x0, G, Gprime] : ( (
 wd( A, B) &
 wd( B, C) &
  wd( A, C) &
   wd( x0, A) &
    wd( x0, C) &
     wd( X, B) &
      wd( X, C) &
       col( X, G, A) &
        col( x0, G, B) &
         col( X, Gprime, A) &
          col( x0, Gprime, B) &
           col( C, x0, A) & col( C, X, B) & col( A, X, B) ) => A = C)))
).
