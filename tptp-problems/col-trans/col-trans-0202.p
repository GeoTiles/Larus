include('col-axioms.ax').

fof(pipo,conjecture,
(! [B, C, D, P, Q, C0, Q1, A1, C1, Y ] : ( (
 wd( P, Q) &
 wd( Q, C0) &
  wd( P, C0) &
   wd( C, D) &
    wd( D, P) &
     wd( C, P) &
      wd( B, Q) &
       wd( B, C) &
        wd( B, D) &
         wd( P, Q1) &
          wd( C0, Q1) &
           wd( P, C1) &
            wd( C0, C1) &
             wd( P, A1) &
              wd( C0, A1) &
               wd( B, C0) &
                wd( B, Q1) &
                 col( C, D, C0) &
                  col( Q, P, Q1) &
                   col( C, D, C1) &
                    col( P, Q1, Y) & col( C0, C1, Y) ) => col( C, D, Y))) 
).
