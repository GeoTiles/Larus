include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, X, Y, Z, Zprime, Xprime] : ( (
 wd( O, X) &
 wd( X, Xprime) &
  wd( Z, O) &
   wd( O, Zprime) &
    wd( Z, Zprime) &
     wd( O, Xprime) &
      wd( O, Z) &
       colH(Z,O,Zprime) &
        colH(Y,Xprime,Zprime) & colH(O,X,Xprime) & colH(O,Xprime,Z)) => colH(X, O, Z)))
).
