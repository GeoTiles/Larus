include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, X, Y, U, V, I] : ( (
 wd( A, B) &
 wd( X, I) &
  wd( U, I) &
   wd( X, A) &
    wd( X, B) &
     wd( Y, A) &
      wd( Y, B) &
       wd( Y, I) &
        wd( V, I) &
         col( I, A, B) &
          col( I, X, Y) &
           col( U, A, B) &
            col( I, X, U) & col( I, Y, V) ) => col( X, A, B)))  ).
