include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, Bprime, Cprime] : ( (
 wd( A, Bprime) &
 wd( B, Bprime) &
  wd( B, C) &
   wd( Bprime, Cprime) &
    wd( A, Cprime) &
     wd( A, C) &
      wd( A, B) &
       wd( Cprime, C) &
        wd( Bprime, C) &
         wd( B, Cprime) &
          col( A, B, C) &
           col( Cprime, Bprime, B) & col( A, Bprime, Cprime) ) => col( A, Bprime, B))) 
).

