include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, P, T, Aprime, Cprime] : ( (
 wd( P, B) &
 wd( A, B) &
  wd( C, B) &
   wd( B, T) &
    wd( C, Cprime) &
     wd( A, Aprime) &
      wd( B, Cprime) &
       wd( B, Aprime) &
        col( B, A, T) &
         col( A, B, C) &
          col( C, B, Cprime) & col( A, B, Aprime) ) => col( Aprime, B, Cprime)))  ).

