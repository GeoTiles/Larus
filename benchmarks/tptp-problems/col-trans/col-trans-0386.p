include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, P, Q, R, Aprime, Dprime, Pprime, Qprime, Rprime, Y ] : ( (
 wd( A, B) &
 wd( B, C) &
  wd( C, D) &
   wd( P, Q) &
    wd( Q, R) &
     wd( D, Dprime) &
      wd( C, Dprime) &
       wd( A, Aprime) &
        wd( B, Aprime) &
         wd( B, D) &
          wd( C, A) &
           wd( Pprime, Qprime) &
            wd( Qprime, Rprime) &
             wd( Y, C) &
              wd( Y, B) &
               col( C, D, Dprime) &
                col( B, A, Aprime) &
                 col( C, Dprime, Y) & col( B, Aprime, Y) ) => col( C, D, Y))) 
).

