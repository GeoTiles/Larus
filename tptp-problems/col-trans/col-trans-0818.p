include('col-axioms.ax').

fof(pipo,conjecture,
(! [H, O, Hprime, Kprime, Oprime, SH, SHprime] : ( (
 wd( H, O) &
 wd( O, SH) &
  wd( H, SH) &
   wd( Hprime, Oprime) &
    wd( Oprime, SHprime) &
     wd( Hprime, SHprime) &
      colH(H, O, SH) & colH(Hprime,Oprime,SHprime) & colH(SHprime,Oprime,Kprime) & ColH Hprime Oprime Kprime
).
