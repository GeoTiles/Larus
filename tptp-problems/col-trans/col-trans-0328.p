include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, Aprime, Bprime, X, Y, P] : ( (
 wd( A, B) &
 wd( X, Y) &
  wd( Aprime, Bprime) &
   wd( A, P) &
    wd( P, X) &
     wd( P, Aprime) &
      wd( A, X) &
       wd( Aprime, X) &
        col( P, A, B) &
         col( P, X, Y) &
          col( P, Aprime, Bprime) & col( A, Aprime, P) ) => col( A, B, Aprime)))  ).
