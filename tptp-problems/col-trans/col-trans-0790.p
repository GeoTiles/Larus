include('col-axioms.ax').

fof(pipo,conjecture,
(! [H, O, L, I] : ( (
 wd( O, H) &
 wd( O, I) &
  wd( H, I) & wd( O, L) & colH(I, O, H) & colH(O, L, I) ) => colH(H,  O,  L)))
).
