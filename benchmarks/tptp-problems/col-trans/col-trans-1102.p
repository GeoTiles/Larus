include('col-axioms.ax').

fof(pipo,conjecture,
(! [A, B, C, G, Aprime, Aprimeprime, Bprime, Cprime, Bprimeprime] : ( (
 wd( G, Bprimeprime) &
 wd( A, B) &
  wd( B, C) &
   wd( A, C) &
    wd( Bprime, A) &
     wd( Bprime, C) &
      wd( Aprime, B) &
       wd( Aprime, C) &
        wd( Cprime, A) &
         wd( Cprime, B) &
          wd( Aprimeprime, Bprimeprime) &
           wd( Aprime, Bprime) &
            wd( Bprimeprime, Bprime) &
             wd( G, Bprime) &
              wd( B, G) &
               wd( Bprimeprime, B) &
                col( G, Bprimeprime, Bprime) &
                 col( Bprimeprime, B, G) &
                  col( Cprime, A, B) &
                   col( Bprime, A, C) &
                    col( G, Aprime, Aprimeprime) &
                     col( Aprimeprime, A, G) & col( Aprime, B, C) ) => col( G, B, Bprime))) 
).

