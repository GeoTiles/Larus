include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, G] : ( (
 wd( A, B) &
 wd( A, C) &
  wd( B, C) &
   wd( B, D) &
    wd( B, D) &
     wd( D, G) &
      wd( B, G) &
       wd( A, D) &
        wd( C, D) &
         colH(A, B, C) & colH(B, D, G) & colH(A, B, D) ) => colH(A,  C,  D)))
).
