include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, R, S, I] : ( (
 wd( D, S) &
 wd( A, B) &
  wd( B, C) &
   wd( C, D) &
    wd( A, D) &
     wd( A, C) &
      wd( B, D) &
       wd( A, S) &
        wd( B, R) &
         wd( S, I) &
          wd( A, R) &
           wd( R, I) &
            wd( R, S) &
             wd( C, R) &
              wd( S, C) &
               wd( S, B) &
                wd( I, C) &
                 wd( I, B) &
                  wd( R, D) &
                   wd( D, I) &
                    wd( A, I) &
                     col( B, C, I) &
                      col( S, R, I) &
                       col( A, D, S) & col( B, C, R) ) => col( C, R, S))) 
).
