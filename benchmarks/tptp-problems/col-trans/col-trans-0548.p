include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B0, C0, E, Eprime, B, C, Bprime] : ( (
 wd( A, B0) &
 wd( B0, C0) &
  wd( A, C0) &
   wd( A, B) &
    wd( A, Bprime) &
     wd( B, Bprime) &
      wd( B, C) &
       col( A, C0, C) &
        col( A, C0, Bprime) &
         col( A, B, Bprime) &
          col( A, B0, B) & col( B0, E, Eprime) ) => col( A, B0, C0))) 
).

