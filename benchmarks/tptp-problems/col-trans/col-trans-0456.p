include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, P, Q, R, Z, T, I, Y0] : ( (
 wd( A, C) &
 wd( P, Q) &
  wd( C, D) &
   wd( R, C) &
    wd( A, B) &
     wd( P, R) &
      wd( T, Z) &
       wd( C, P) &
        wd( Q, C) &
         wd( A, Z) &
          wd( I, Z) &
           wd( I, C) &
            wd( T, A) &
             wd( Z, C) &
              wd( R, I) &
               wd( Y0, I) &
                wd( Y0, Z) &
                 wd( Y0, C) &
                  col( P, R, R) &
                   col( A, T, Z) &
                    col( P, R, Q) &
                     col( C, R, Y0) &
                      col( C, I, Y0) & col( C, R, Z) ) => col( I, Y0, Z))) 
).
