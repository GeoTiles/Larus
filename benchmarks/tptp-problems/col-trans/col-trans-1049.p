include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, I , J, K, D] : ( (
 wd( A, B) &
 wd( A, D) &
  wd( B, D) &
   wd( J, A) &
    wd( J, D) &
     wd( I, B) &
      wd( I, D) &
       wd( K, A) &
        wd( K, B) &
         col( D, B, J) &
          col( D, A, I) &
           col( K, A, B) &
            col( I, B, D) & col( J, A, D) ) => col( A, B, D)))  ).

