include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, A, Aprime, Bprime, X, Y] : ( (
 wd( A, Aprime) &
 wd( Aprime, Bprime) &
  wd( O, A) &
   wd( O, Aprime) &
    wd( X, Y) &
     wd( A, Bprime) &
      col( O, Aprime, Bprime) &
       col( O, X, Y) &
        col( A, Aprime, Bprime) & col( O, A, A) ) => col( O, A, Aprime)))  ).
