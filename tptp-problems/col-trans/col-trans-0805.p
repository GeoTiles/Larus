include('col-axioms.ax').

fof(pipo,conjecture,
(! [H, K, O, L, Hprime, Kprime, Oprime, Lprime, Kprimeprime, Lprimeprime, I, Iprime] : ( (
 wd( Oprime, Kprimeprime) &
 wd( Oprime, Kprime) &
  wd( Oprime, Lprimeprime) &
   wd( Oprime, Lprime) &
    wd( O, H) &
     wd( K, I) &
      wd( I, L) &
       wd( K, L) &
        wd( O, I) &
         wd( Oprime, Iprime) &
          wd( Iprime, Lprimeprime) &
           wd( Kprimeprime, Iprime) &
            wd( Iprime, Lprimeprime) &
             wd( Kprimeprime, Lprimeprime) &
              wd( K, O) &
               colH(Oprime,Kprime,Kprimeprime) &
                colH(Oprime,Lprime,Lprimeprime) &
                 colH(K, I, L) &
                  colH(Oprime,Iprime,Hprime) &
                   colH(O, I, H) &
                    colH(Kprimeprime,Iprime,Lprimeprime) & colH(Kprimeprime,Oprime,Iprime)) => colH(Kprime,Oprime,Lprime)))
).
