include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, Aprime, Bprime, Cprime, Dprime, Aprimeprime, Cprimeprime, Dprimeprime] : ( (
 wd( A, B) &
 wd( B, D) &
  wd( A, D) &
   wd( Aprime, Bprime) &
    wd( Bprime, Dprime) &
     wd( Aprime, Dprime) &
      wd( A, B) &
       wd( B, C) &
        wd( A, C) &
         wd( Aprime, Bprime) &
          wd( Bprime, Cprime) &
           wd( Aprime, Cprime) &
            wd( Aprimeprime, Bprime) &
             wd( Bprime, Dprimeprime) &
              wd( Aprimeprime, Dprimeprime) &
               wd( A, C) &
                wd( C, D) &
                 wd( A, D) &
                  wd( Aprimeprime, Cprimeprime) &
                   wd( Cprimeprime, Dprimeprime) &
                    wd( Aprimeprime, Dprimeprime) &
                     col(A, B, D) &
                      col(Aprime,Bprime,Dprime) &
                       col(Aprimeprime,Bprime,Dprimeprime) & col(D, B, C) ) => col(A,  B,  C)))
).
