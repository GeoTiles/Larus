include('col-axioms.ax').

fof(pipo,conjecture,
(! [H, K, O, Hprime, Oprime, SH, SHprime] : ( (
 wd( H, O) &
 wd( O, SH) &
  wd( H, SH) &
   wd( Hprime, Oprime) &
    wd( Oprime, SHprime) &
     wd( Hprime, SHprime) &
      colH(H, O, SH) & colH(Hprime,Oprime,SHprime) & colH(SH, O, K )=> colH(H, O, K)
).
