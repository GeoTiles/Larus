include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B0, C0, B, Bprime, E, Eprime, C, D ] : ( (
 wd( A, C) &
 wd( A, B0) &
  wd( B0, C0) &
   wd( A, C0) &
    wd( A, B) &
     wd( A, Bprime) &
      wd( B, Bprime) &
       wd( B, C) &
        wd( C, D) &
         wd( B, D) &
          col( A, C0, A) &
           col( A, C0, C) &
            col( B0, E, Eprime) &
             col( A, B, Bprime) &
              col( A, B0, B) & col( B, C, D) ) => col( A, Bprime, B0))) 
).
