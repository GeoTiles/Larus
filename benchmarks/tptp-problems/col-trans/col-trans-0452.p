include('col-axioms.ax').

fof(pipo,conjecture,
(! [B, O, P, T, R, Tprime] : ( (
 wd( O, P) &
 wd( R, B) &
  wd( T, R) &
   wd( T, Tprime) &
    wd( B, O) &
     wd( R, O) &
      wd( R, Tprime) &
       col( R, B, R) &
        col( R, B, T) & col( R, T, Tprime) ) => col( R, B, Tprime)))  ).

