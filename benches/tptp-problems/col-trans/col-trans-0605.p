include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, D, P, Bprime] : ( (
 wd( A, P) &
 wd( A, C) &
  wd( P, C) &
   wd( P, B) &
    wd( P, D) &
     wd( A, B) &
      wd( A, D) &
       wd( B, Bprime) &
        wd( A, Bprime) &
         wd( C, D) &
          wd( B, C) &
           col( Bprime, A, C) &
            col( B, A, Bprime) & col( P, A, C) ) => col( B, A, C))) 
).
