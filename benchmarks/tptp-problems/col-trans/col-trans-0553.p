include('col-axioms.ax').

fof(pipo,conjecture,
(! [P, Q, A, B, C, Dprime, Pprime, Cprime, Dprimeprime, Pprimeprime, Z, Zprime ] : ( (
 wd( P, Q) &
 wd( B, Cprime) &
  wd( Cprime, Dprimeprime) &
   wd( B, Dprimeprime) &
    wd( A, B) &
     wd( B, C) &
      wd( A, C) &
       wd( Cprime, Pprimeprime) &
        wd( B, Pprime) &
         wd( Z, Zprime) &
          wd( Dprime, B) &
           wd( Zprime, B) &
            wd( Z, B) &
             wd( B, Pprimeprime) &
              wd( Cprime, C) &
               wd( A, Dprime) &
                wd( Pprime, Cprime) &
                 col( A, B, Zprime) &
                  col( A, B, Dprimeprime) &
                   col( B, C, Z) &
                    col( Cprime, Dprimeprime, Pprimeprime) &
                     col( B, Cprime, A) & col( B, Dprime, Pprime) ) => col( B, Cprime, Dprimeprime)))
).
